class RubyAlign::Parser::Line
  def initialize
    @vasgn_matcher = RubyAlign::Matcher::ValueAssign.new
    @hpair_matcher = RubyAlign::Matcher::HashPair.new
  end

  def parse line
    if matched = @vasgn_matcher.match(line)
      obj = @vasgn_matcher.gen_obj matched
    elsif matched = @hpair_matcher.match(line)
      obj = @hpair_matcher.gen_obj matched
    end
  end
end
