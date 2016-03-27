require 'spec_helper'

describe 'Integrated test' do
  subject = <<'EOS'
a = 1
bb += 20
ccc ||= %[ foo bar ]
d = a ? a : bb
EOS
  expect_out = <<'EOS'
a     = 1
bb   += 20
ccc ||= %[ foo bar ]
d = a ? a : bb
EOS

  tester = TestAlign.new

  it 'align by =' do
    expect(tester.parse_text(subject)).to eq expect_out
  end
end
