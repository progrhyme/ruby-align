class RubyAlign::Parser::Line
  @@heading_words = %w[
    class module def if unless case while until for loop begin BEGIN END
  ]
  @@footer_words = %w[ end ]

  def initialize
  end

  def detect_type line
    if include_header? line
    end
  end

  def include_header? line
    return true if typical_header_regexp().match line
    line =~ Regexp.new(' do |{')
  end

  def typical_header_regexp
    @typical_header_regexp ||= Regexp.new('^\s*(' + @@header_pattern.join('|') + ')')
  end

end
