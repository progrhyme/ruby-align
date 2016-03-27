require 'spec_helper'

describe 'Integrated Tests to parse Ruby Files' do
  tester = TestAlign.new
  Dir.glob('spec/subjects/*.rb').each do |sbj|
    base    = File.basename sbj
    expects = File.open("spec/expects/#{base}") do |ex| ex.read end
    it "Align #{base}" do
      out = tester.parse_file sbj
      expect(out).to eq expects
    end
  end
end
