require 'spec_helper'

describe 'Constructor' do
  context 'without path param' do
    it 'can initialize' do
      config = RubyAlign::Config.new
      expect(config).to be_an_instance_of(RubyAlign::Config)
    end
  end
end
