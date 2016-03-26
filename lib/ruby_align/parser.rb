class RubyAlign::Parser

  def initialize config
    @config = config
    @raw = {}
  end

  def parse texts
    texts.each_with_index do |line, idx|
      @raw[idx] = line
    end
  end

  def output
    @raw.each_pair do |i, line|
      puts line
    end
  end
end
