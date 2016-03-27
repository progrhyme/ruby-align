class RubyAlign::CLI

  def initialize params
    @config   = RubyAlign::Config.new
    @raw_text = RubyAlign::RawText.new
    @parser   = RubyAlign::Parser.new @config
  end

  def self.parse_args *args
    {}
  end

  require 'parser/current'
  class ::Parser::Source::Range
    def multi_lines?
      (last_line - line) > 0
    end
  end

  def run
    require 'pp'
    text = @raw_text.lines.join("\n")
    ast  = Parser::CurrentRuby.parse(text).loc
    #pp ast
    targets = []
    ast.node.children.each do |c|
      if ! [:lvasgn, :ivasgn, :cvasgn].include? c.type
        p ':' + c.type.to_s + ' is not target type'
        next
      end
      c_ast = c.loc
      if c_ast.expression.multi_lines?
        p 'multi-lines found in ' + c_ast.expression.source
        next
      end
      targets << c_ast
      p c_ast.expression.source
    end

    #buf  = Parser::Source::Buffer.new('ruby-align')
    #buf.raw_source = text
    #pp buf
    #child = Parser::Source::Range.new(buf, ast.name.end_pos + 1, ast.end.begin_pos - 1)
    #c_ast = Parser::CurrentRuby.parse(child.source).loc
    #pp c_ast
    #pp ast.end
    #pp ast.expression

    #@parser.parse @raw_text.lines
    #@parser.output
  end
end
