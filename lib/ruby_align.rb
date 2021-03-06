module RubyAlign
  module Model
  end
  module Matcher
  end
end

require 'logger'
require 'optparse'
require 'toml'

require_relative 'ruby_align/version'
require_relative 'ruby_align/cli'
require_relative 'ruby_align/config'
require_relative 'ruby_align/context'
require_relative 'ruby_align/parser'
require_relative 'ruby_align/parser/line'
require_relative 'ruby_align/raw_text'
require_relative 'ruby_align/paragraph'
require_relative 'ruby_align/matcher/brace_count'
require_relative 'ruby_align/matcher/hash_pair'
require_relative 'ruby_align/matcher/value_assign'
require_relative 'ruby_align/model/parsed_line'
require_relative 'ruby_align/model/hash_pair'
require_relative 'ruby_align/model/value_assign'
