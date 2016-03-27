class RubyAlign::Parser::Line
  def initialize
    @vasgn_matcher = RubyAlign::Matcher::ValueAssign.new
  end

  def parse line
    if matched = @vasgn_matcher.match(line)
      obj = @vasgn_matcher.gen_obj matched
    end
  end
end
