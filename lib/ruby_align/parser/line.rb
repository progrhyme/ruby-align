class RubyAlign::Parser::Line
  def initialize indent
    @indent        = indent || 1
    @vasgn_matcher = RubyAlign::Matcher::ValueAssign.new
    @hpair_matcher = RubyAlign::Matcher::HashPair.new
    @brace_matcher = RubyAlign::Matcher::BraceCount.new
  end

  def parse line, ctx
    unless ctx.get_level
       lv = Regexp.new('^( *)').match(line).to_s.length / @indent
       ctx.set_level lv
    end
    lv_d = @brace_matcher.level_change line
    ctx.change_level lv_d
    if matched = @vasgn_matcher.match(line)
      obj = @vasgn_matcher.gen_obj matched
    elsif matched = @hpair_matcher.match(line)
      obj = @hpair_matcher.gen_obj matched
    end
  end
end
