class RubyAlign::Config
  @@default = {
    indent: 2,
  }

  def initialize path: ENV['RUBY_ALIGN_CONFIG'] || '.ruby-align.toml'
    @mine = File.readable?(path) ? TOML.load_file(path) : {}
  end

  def method_missing method
    if @mine.has_key? method.to_s
      @mine[method.to_s]
    elsif @@default.has_key? method.to_sym
      @@default[method.to_sym]
    end
  end
end
