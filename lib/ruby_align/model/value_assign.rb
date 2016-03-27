class RubyAlign::Model::ValueAssign
  attr :lhs, :op, :rhs

  def initialize(lhs: nil, op: nil, rhs: nil)
    @lhs = lhs
    @op  = op
    @rhs = rhs
  end
end
