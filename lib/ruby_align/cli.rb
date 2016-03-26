class RubyAlign::CLI

  def initialize(params)
  end

  def self.parse_args(*args)
    {}
  end

  def run
    input = ''
    while line = $stdin.gets
      input << line
    end
    puts input
  end
end
