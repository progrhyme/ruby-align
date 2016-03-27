class RubyAlign::CLI

  def initialize params
    @config   = RubyAlign::Config.new
    @raw_text = RubyAlign::RawText.new
    @parser   = RubyAlign::Parser.new @config
  end

  def self.parse_args *args
    {}
  end

  def run
    @parser.parse @raw_text
    #@parser.output
  end
end
