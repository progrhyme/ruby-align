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

  def parse_file file
    $stdout = StringIO.new
    RubyAlign::CLI.new({'file' => file}).run
    parsed = $stdout.string
    $stdout  = STDOUT
    parsed
  end
end
