class RubyAlign::RawText
  attr :content, :lines

  def initialize
    @content = ''
    @lines   = []
    while line = $stdin.gets
      @content << line
      line.chomp!
      @lines << line
    end
  end
end
