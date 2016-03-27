class RubyAlign::Matcher::ValueAssign
  def initialize
    @regexp = Regexp.new regexp_pattern()
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

  private

  def regexp_pattern
    lhs = '[@$]?(?:\w[\w\.]*)?\w'
    op  = '(?:\+|\|\|-)?=|<<'
    rhs = '.*[^\\\{\(]'

    '^\s*(%s)\s*(%s)\s*(%s)$' % [lhs, op, rhs]
  end
end