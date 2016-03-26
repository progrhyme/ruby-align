class RubyAlign::CLI

  def initialize params
    @raw_text = RubyAlign::RawText.new
  end

  def self.parse_args *args
    {}
  end

  def run
    @raw_text.lines.each do |line|
      puts line
    end
  end
end
