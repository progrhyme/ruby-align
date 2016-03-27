class ::Parser::Source::Range
  def multi_lines?
    (last_line - line) > 0
  end
end
