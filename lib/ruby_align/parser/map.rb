class RubyAlign::Parser::Map
  # @param node [Parser::Source::Map]
  def initialize map
    @map = map
  end

  def method_missing method
    @map.send(method)
  end

  def value
    Parser::Source::Range.new(
      @map.expression.source_buffer,
      @map.operator.end_pos + 1,
      @map.expression.end_pos,
    )
  end
end
