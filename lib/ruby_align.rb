module RubyAlign
  module Model
  end
end

require 'logger'
require 'toml'

require_relative 'ruby_align/cli'
require_relative 'ruby_align/config'
require_relative 'ruby_align/parser'
require_relative 'ruby_align/parser/line'
require_relative 'ruby_align/raw_text'
require_relative 'ruby_align/model/value_assign'
