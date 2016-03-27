class RubyAlign::Model::ParsedLine
  attr :lhs, :op, :rhs
  attr_accessor :index

  def initialize(lhs: nil, op: nil, rhs: nil)
    @lhs = lhs
    @op  = op
    @rhs = rhs
  end
end
