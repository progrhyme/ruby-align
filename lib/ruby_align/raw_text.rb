class RubyAlign::RawText
  attr :content, :lines

  def initialize file: nil
    @content = ''
    @lines   = []
    read = file ? File.open(file) : $stdin
    while line = read.gets
      @content << line
      @lines << line.chomp
    end
    read.close if file
  end
end
