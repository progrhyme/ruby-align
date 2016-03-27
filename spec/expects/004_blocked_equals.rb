ALIGN_CONST = :foo
$g_align    = 'align'

class BlockedEquals
  @@be                = ['b', 'e']
  @class_instance_var = 'ok'

  def initialize
    @i  = nil
    foo = 'Foo'
    @bar = foo ? foo : nil
  end
end
