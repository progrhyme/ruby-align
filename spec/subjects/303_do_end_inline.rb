x = 1
$g_id = x * 20
@array = %w/xXx y zz/

def foo
  a = nil
  @bar = %q(b a rrr)
  @array.each do |i| p i end
  h = {
    'key' => @value,
    id: nil,
  }
end

foo()

@bar = 'Bar'
a = x + 100
