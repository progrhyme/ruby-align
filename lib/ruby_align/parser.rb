class RubyAlign::Parser

  # @param config [RubyAlign::Config]
  # @param logger [Logger]
  def initialize(config: nil, logger: nil)
    @config = config
    @logger = logger
    @raw    = {}
    @liner  = Line.new
    @parsed = {}
    @formed = {}
  end

  # @param raw [RubyAlign::RawText]
  def parse raw
    require 'pp'
    raw.lines.each_with_index do |line, idx|
      @raw[idx] = line
      if parsed = parse_line(line)
        @parsed[idx] = parsed
        debug parsed.inspect
      end
    end

    max_lhs_length = @parsed.values.map {|p| p.lhs.size }.max
    @parsed.each_pair do |i, p|
      fmt = "%-#{max_lhs_length}s %s %s"
      @formed[i] = fmt % [p.lhs, p.op, p.rhs]
    end
  end

  def render_output
    new_buf = ''
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

  def debug log
    return unless @logger
    @logger.debug log
  end

end
