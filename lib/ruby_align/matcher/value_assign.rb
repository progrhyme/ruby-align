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
      spc: m_a[1], lhs: m_a[2], op: m_a[3], rhs: m_a[4],
    )
  end

  private

  def regexp_pattern
    lhs = "(?:@{1,2}|\\$)?\\w[\\w\.:\\[\\]'\"]*"
    op  = '(?:\+|\|\||-)?=|<<'
    rhs = '[^\?]*(?! ? )[^\?]*'

    '^(\s*)(%s)\s*(%s)\s*(%s)$' % [lhs, op, rhs]
  end
end
