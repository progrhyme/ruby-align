class RubyAlign::CLI

  def initialize params
    @config   = RubyAlign::Config.new
    @logger   = gen_logger()
    @raw_text = RubyAlign::RawText.new
    @parser   = RubyAlign::Parser.new(config: @config, logger: @logger)
  end

  def self.parse_args *args
    {}
  end

  def run
    @parser.parse @raw_text
    puts @parser.render_output
  end

  private

  def gen_logger
    lg = Logger.new STDERR
    lg.level = @config.log_level || 'DEBUG'
    lg.progname  = [$0, ARGV].join(%q[ ])
    lg.formatter = proc do |level, date, prog, msg|
      log = msg.gsub(/\r/, '\r').gsub(/\n/, '\n')
      "#{date} [#{level}] #{log} -- #{prog}\n"
    end
    lg
  end
end
