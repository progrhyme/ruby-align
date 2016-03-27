class RubyAlign::Matcher::ValueAssign
  def initialize
    @regexp = Regexp.new(
      '^\s*([@$:]?(?:\w[\w\.]*)?\w)\s*((?:\+|\|\|-)?=|<<)\s*(.*[^\\\])$')
  end

  def match str
    @regexp.match str
  end

  def gen_obj matched
    m_a = matched.to_a
    RubyAlign::Model::ValueAssign.new(
      lhs: m_a[1], op: m_a[2], rhs: m_a[3],
    )
  end
end
