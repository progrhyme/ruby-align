class RubyAlign::RawText
  attr :lines

  def initialize
    @lines = []
    while line = $stdin.gets
      line.chomp!
      @lines << line
    end
  end
end
