class RubyAlign::Matcher::BraceCount

  def initialize
    @up_ptn   = Regexp.new up_regexp_ptn()
    @down_ptn = Regexp.new '(\)|}|\]|(\s|^)end(\s|$))'
  end

  def level_change str
    up   = str.scan(@up_ptn).size
    down = str.scan(@down_ptn).size
    up - down
  end

  private

  def up_regexp_ptn
    keywords = %w[class module def if unless case while until for loop begin BEGIN END do]
    pattern = keywords.join('|')

    '(\(|{|\[|(\s|^)(%s)(\s|$)|\\\\s*$)' % [pattern]
  end
end
