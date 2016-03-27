class RubyAlign::Model::ParsedLine
  attr :spc, :lhs, :op, :rhs
  attr_accessor :index

  def initialize(spc: nil, lhs: nil, op: nil, rhs: nil)
    @spc = spc
    @lhs = lhs
    @op  = op
    @rhs = rhs
  end
end
