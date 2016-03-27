class RubyAlign::Paragraph
  attr :start_idx, :end_idx

  # @param start_idx [Fixnum] line number index in file
  def initialize start_idx
    @start_idx   = start_idx
    @end_idx     = start_idx
    @parsed_list = []
  end

  def list
    @parsed_list
  end

  # @param [RubyAlign::Model] parsed object
  def append parsed
    @parsed_list << parsed
    @end_idx = parsed.index
  end

  def include? idx
    @start_idx <= idx and idx <= @end_idx
  end
end
