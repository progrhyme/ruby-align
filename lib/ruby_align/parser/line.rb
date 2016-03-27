class RubyAlign::Parser::Line
  def initialize
  end

  def parse line
    matcher = Regexp.new('^\s*([@$:]?(?:\w[\w\.]*)?\w)\s*((?:\+|\|\|-)?=|<<)\s*(.*[^\\\])$')
    if matched = matcher.match(line)
      m_a = matched.to_a
      obj = RubyAlign::Model::ValueAssign.new(
        lhs: m_a[1], op: m_a[2], rhs: m_a[3],
      )
    end
  end
end
