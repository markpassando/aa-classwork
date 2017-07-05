#TIME COMPLEXITY = N!
def first_anagram?(string1, string2)
  array = string1.chars

  total_permutations = permutations(array)
  total_permutations.map! { |perm| perm.join}
  total_permutations.include?(string2)
end

def permutations(array)
  return [array] if array.length <= 1

  first = array.shift
  perms = permutations(array)
  total_permutations = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
    end
  end
  total_permutations
end

#TIME COMPLEXITY = N ** 2
def second_anagram?(string1, string2)
  arr1 = string1.chars
  arr2 = string2.chars

  arr1.each_with_index do |el1, i|
    arr2.each_with_index do |el2, j|
      if el1 == el2
        arr1[i] = nil
        arr2[j] = nil
      end
    end
  end

  arr1 == arr2
end

#TIME COMPLEXITY = NlogN
def third_anagram?(string1, string2)
  arr1 = string1.chars.sort
  arr2 = string2.chars.sort

  arr1 == arr2
end

#TIME COMPLEXITY = O(n)
def fourth_anagram?(string1, string2)
  arr1 = string1.chars
  arr2 = string2.chars

  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  arr1.each { |el| hash1[el] += 1}
  arr2.each { |el| hash2[el] += 1}

  hash1 == hash2
end

def fourth_anagram?(string1, string2)
  arr1 = string1.chars
  arr2 = string2.chars

  hash = Hash.new(0)

  arr1.each { |el| hash[el] += 1}
  arr2.each { |el| hash[el] -= 1}

  hash.values.all? {|val| val == 0}
end
