class RubyAlign::Parser

  def initialize config
    @config = config
    @raw    = {}
    @root   = RubyAlign::Model::Node.new
    @liner  = RubyAlign::Parser::Line.new
  end

  def parse texts
    texts.each_with_index do |line, idx|
      @raw[idx] = line
      type = @liner.detect_type line
    end
  end

  def output
    @raw.each_pair do |i, line|
      puts line
    end
  end
end
