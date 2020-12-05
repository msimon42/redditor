class Timer
  def start
    @start_time = Time.now
  end

  def count
    return %Q[#{Time.now - @start_time} seconds] if @start_time
    raise start_error
  end

  def reset
    return @start_time = Time.now if @start_time
    raise start_error
  end

  def stop
    if @start_time
      end_count = count
      @start_time = nil
      return count
    end
    raise start_error
  end

  private
        def start_error
          "Timer is not running. Did you forget to start?"
        end
end
