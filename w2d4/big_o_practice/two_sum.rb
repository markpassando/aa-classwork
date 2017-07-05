#TIME COMPLEXITY = N ** 2
require 'byebug'
def bad_two_sum?(arr, target_sum)
  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target_sum
      j += 1
    end
    i += 1
  end
  false
end

#TIME COMPLEXITY = NlogN
def okay_two_sum?(arr, target_sum)
  arr.sort!
  # debugger
  arr.each_with_index do |num, i|
    break if num > target_sum
    new_target = target_sum - num
    return true if bsearch(arr[0...i] + arr[i+1..-1], new_target)
  end
  false
end

def bsearch(nums, target)
  return nil if nums.empty?

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1
    bsearch(nums.take(probe_index), target)
  when 0
    probe_index # found it!
  when 1

    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    (sub_answer.nil?) ? nil : (probe_index + 1) + sub_answer
  end

end

#TIME COMPLEXITY = N
def hash_two_sum?(nums, target)
  #debugger
  hash = Hash.new
  nums.each do |num|
    hash[target-num] = num unless target - num == num
  end

  nums.each_with_index do |x, i|
    #debugger
    return true if hash[x] != nil
  end
  false
end
