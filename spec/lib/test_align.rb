class TestAlign
  def initialize
  end

  def parse_text text
    $stdin  = StringIO.new text
    $stdout = StringIO.new
    RubyAlign::CLI.new({}).run
    parsed = $stdout.string
    $stdin   = STDIN
    $stdout  = STDOUT
    parsed
  end
end
