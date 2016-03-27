class RubyAlign::Parser

  def initialize config
    @config  = config
    @raw     = {}
    @targets = {}
  end

  # @param raw [RubyAlign::RawText]
  def parse raw
    raw.lines.each_with_index do |line, idx|
      @raw[idx] = line
    end

    require 'pp'
    text = raw.content
    ast  = Parser::CurrentRuby.parse(text).loc
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
      tgt = RubyAlign::Parser::Map.new(c_ast)
      @targets[c_ast.line] = tgt
      #pp c_ast
      p c_ast.expression.source
    end

    #buf  = Parser::Source::Buffer.new('ruby-align')
    #buf.raw_source = text
    #pp buf
  end

  def output
    @raw.each_pair do |i, line|
      puts line
    end
  end
end
