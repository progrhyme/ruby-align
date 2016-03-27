class RubyAlign::Matcher::HashPair
  def initialize
    @regexps = regexp_patterns().map {|ptn| Regexp.new(ptn) }
  end

  def match str
    @regexps.each do |rg|
      if m = rg.match(str)
        return m
      end
    end
    nil
  end

  def gen_obj matched
    m_a = matched.to_a
    RubyAlign::Model::HashPair.new(
      spc: m_a[1], lhs: m_a[2], op: m_a[3], rhs: m_a[4],
    )
  end

  private

  def regexp_patterns
    [ old_fashioned_regexp_ptn(), sugared_sym_regexp_ptn() ]
  end

  def old_fashioned_regexp_ptn
    _lhs = '\S+'
    lhs = "'#{_lhs}'|\"#{_lhs}\"|#{_lhs}|:\w+"
    op  = '=>'
    rhs = '.*'

    '^(\s*)(%s)\s*(%s)\s*(%s)$' % [lhs, op, rhs]
  end

  def sugared_sym_regexp_ptn
    lhs = '\w+'
    op  = ':'
    rhs = '.*'

    '^\s*(%s)(%s)\s*(%s)$' % [lhs, op, rhs]
  end
end
