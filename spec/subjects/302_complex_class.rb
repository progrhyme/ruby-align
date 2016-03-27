class Foo::Bar
  @@me = nil
  @@default = {
    foo: 'Bar',
    'baar' => :fooo
  }

  def initialize a: nil, b: 0
    @a_var = a
    @b = b ? b : nil
    @c = {
      x: 'y',
      zz_Z: true,
      'tree' => {
        "ID" => 1234,
        stem: 'sibling',
      }
    }
  end

  def self.fetch
    x = @a_var - 10
    yy_and_y ||= @b / @c
    @c -= x
    new(
      a: x,
      'bbb' => %Q!oh my goodness!
    )
  end

  module Xxx
    XXX = 1
    Y = nil
    module_function

    def util
      anonymous = true
      h = {
        'key' => 'value',
        logic: 'going on',
      }
      h[:sym] = 1
      h['child'] ||= {}
      h['child']['leaf'] = %r{Fire Red}
    end
  end
end
