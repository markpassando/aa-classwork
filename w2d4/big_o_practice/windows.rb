require 'byebug'
require_relative 'stacks_n_queues'

#TIME COMPLEXITY = N
def naive_window(arr, window)
  current_max_range = nil
  # debugger
  arr.each_with_index do |num, i|
    break if i + window > arr.length
    max = arr[i...i+window].max
    min = arr[i...i+window].min
    total = max - min
    current_max_range = total if current_max_range.nil? || total > current_max_range
  end
  current_max_range
end

def optimized_window(arr, window)
  current_max_range = nil
  q = StackQueue.new
  
  arr.each do |num|
    if q.size < window
      q.enqueue(num)
    else
      q.enqueue(num)
      q.dequeue
    end

    range = q.max - q.min
    current_max_range = range if current_max_range == nil || range > current_max_range
  end
  current_max_range
end
