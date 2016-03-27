# Context in parsing process
class RubyAlign::Context
  attr :cur_index

  # @param start_idx [Fixnum]
  def initialize start_idx=0
    @start_idx = start_idx
    @end_idx   = @start_idx
    @cur_index = @start_idx
    @levels    = {}
  end

  def set_level level
    @levels[@cur_index] = level
  end

  def change_level change
    current = get_level()
    next_lv = current
    case change
    when -1
      if current == 0
        warn "Level can't be negative. current:#{current}, change:#{change}. Set to 0"
        next_lv = 0
      else
        next_lv = current - 1
      end
      @levels[@cur_index] = next_lv
      @cur_index += 1
      @levels[@cur_index] = next_lv
    when 0
      @levels[@cur_index] = next_lv
      @cur_index += 1
      @levels[@cur_index] = next_lv
    when 1
      next_lv = current + 1
      @cur_index += 1
      @levels[@cur_index] = next_lv
    end
    @end_idx = @cur_index
  end

  def get_level idx=nil
    idx ||= @cur_index
    @levels[idx]
  end
end
