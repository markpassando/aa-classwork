#TIME COMPLEXITY = N ** 2
def my_min(list)
  smallest_number = nil
  list.each_with_index do |num, i|
    if list.all? { |num2| num <= num2 }
      smallest_number = num
    end
  end
  smallest_number
end

#TIME COMPLEXITY = N
def my_min2(list)
  smallest_number = list.first
  list.each do |num|
    smallest_number = num if num <= smallest_number
  end
  smallest_number
end

#TIME COMPLEXITY = N ** 2
def sub_sum(list)
  result = []
  i = 0
  while i < list.length
    result << [list[i]]
    j = i + 1
    while j < list.length
      result << list[i..j]
      j += 1
    end
    i += 1
  end

  result.map! { |arr| arr.reduce(:+) }
  result.max
end

#TIME COMPLEXITY = N
def sub_sum2(list)
  total = 0
  list.each { |x| total += x if x > 0}
  total
end
