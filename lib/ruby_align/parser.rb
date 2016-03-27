class RubyAlign::Parser

  # @param config [RubyAlign::Config]
  # @param logger [Logger]
  def initialize(config: nil, logger: nil)
    @config     = config
    @logger     = logger
    @context    = RubyAlign::Context.new
    @raw        = {}
    @liner      = Line.new config.indent
    @paragraphs = []
    @parsed     = {}
    @formed     = {}
  end

  # @param raw [RubyAlign::RawText]
  def parse raw
    last_parsed   = nil
    cur_paragraph = nil
    prev_level    = nil

    raw.lines.each_with_index do |line, idx|
      @raw[idx] = line
      if parsed = parse_line(line, @context)
        if   !cur_paragraph \
          or parsed.class != last_parsed.class \
          or cur_paragraph.end_idx < idx - 1 \
          or @context.get_level(idx) != prev_level

          cur_paragraph = new_paragraph(idx)
        end

        parsed.index = idx
        @parsed[idx] = parsed
        cur_paragraph.append(parsed)
        last_parsed = parsed
        prev_level  = @context.get_level(idx)

        debug parsed.inspect
      end
    end

    @paragraphs.each do |pgrh|
      parsed_list    = pgrh.list
      max_lhs_length = parsed_list.map {|p| p.lhs.size }.max
      max_op_length  = parsed_list.map {|p| p.op.size }.max
      parsed_list.each do |p|
        lv  = @context.get_level(p.index)
        spc = %q[ ] * @config.indent * lv
        if p.op == ':'
          fmt = "%s%-#{max_lhs_length + 3}s %s"
          @formed[p.index] = fmt % [spc, p.lhs + p.op, p.rhs]
        else
          fmt = "%s%-#{max_lhs_length}s %#{max_op_length}s %s"
          @formed[p.index] = fmt % [spc, p.lhs, p.op, p.rhs]
        end
        debug '%d : %s' % [ lv, @formed[p.index] ]
      end
    end
  end

  def render_output
    new_buf       = %q[]
    cur_paragraph = @paragraphs[0]
    @raw.each_pair do |i, line|
      out_l = @formed[i] ? @formed[i] : line
      new_buf << out_l + "\n"
    end
    new_buf
  end

  private

  def parse_line line, ctx
    @liner.parse line, ctx
  end

  def new_paragraph index
    prgh         = RubyAlign::Paragraph.new index
    @paragraphs << prgh
    prgh
  end

  def debug log
    return unless @logger
    @logger.debug log
  end
end
