class RubyAlign::Parser

  # @param config [RubyAlign::Config]
  # @param logger [Logger]
  def initialize(config: nil, logger: nil)
    @config = config
    @logger = logger
    @raw    = {}
    @liner  = Line.new
    @paragraphs = []
    @parsed = {}
    @formed = {}
  end

  # @param raw [RubyAlign::RawText]
  def parse raw
    last_parsed   = nil
    cur_paragraph = nil

    raw.lines.each_with_index do |line, idx|
      @raw[idx] = line
      if parsed = parse_line(line)
        if   !cur_paragraph \
          or parsed.class != last_parsed.class \
          or cur_paragraph.end_idx < idx - 1

          cur_paragraph = new_paragraph(idx)
        end

        parsed.index = idx
        @parsed[idx] = parsed
        cur_paragraph.append(parsed)
        last_parsed = parsed

        debug parsed.inspect
      end
    end

    require 'pp'
    pp @paragraphs

    @paragraphs.each do |pgrh|
      parsed_list = pgrh.list
      max_lhs_length = parsed_list.map {|p| p.lhs.size }.max
      parsed_list.each do |p|
        fmt = "%s%-#{max_lhs_length}s %s %s"
        @formed[p.index] = fmt % [p.spc, p.lhs, p.op, p.rhs]
      end
    end
  end

  def render_output
    new_buf = ''
    cur_paragraph = @paragraphs[0]
    @raw.each_pair do |i, line|
      out_l = @formed[i] ? @formed[i] : line
      new_buf << out_l + "\n"
    end
    new_buf
  end

  private

  def parse_line line
    @liner.parse line
  end

  def new_paragraph index
    prgh = RubyAlign::Paragraph.new index
    @paragraphs << prgh
    prgh
  end

  def debug log
    return unless @logger
    @logger.debug log
  end
end
