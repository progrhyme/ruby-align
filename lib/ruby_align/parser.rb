class RubyAlign::Parser

  def initialize config
    @config  = config
    @raw     = {}
    @targets = {}
    @parsed  = {}
  end

  # @param raw [RubyAlign::RawText]
  def parse raw
    raw.lines.each_with_index do |line, idx|
      @raw[idx + 1] = line
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

    max_name_length = @targets.values.map {|t| t.name.size }.max
    @targets.each_pair do |l, t|
      fmt = "%-#{max_name_length}s %s %s"
      @parsed[l] = fmt % [t.name.source, t.operator.source, t.value.source]
    end
  end

  def render_output
    new_buf = ''
    @raw.each_pair do |i, line|
      out_l = @parsed[i] ? @parsed[i] : line
      #p "#{i} #{out_l}"
      new_buf << out_l + "\n"
    end
    new_buf
  end
end
