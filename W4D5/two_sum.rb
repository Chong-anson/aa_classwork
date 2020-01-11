def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el1, i|
    arr.each_with_index do |el2, j|
      return true if el1 + el2 == target_sum && j > i
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 10) # => should be false
# p bad_two_sum?(arr, 6) # => should be true

# arr = [18, 15, 17, 19, 19, 2, 17, 0, 3, 11, 0, 17, 11, 8, 19, 15, 1, 9, 9, 6]
# arr2 = [0, 0, 1, 2, 3, 6, 8, 9, 9, 11, 11, 15, 15, 17, 17, 17, 18, 19, 19, 19]  => 16
# i = 0, j = 19 > 16
def okay_two_sum?(arr, target_sum)
  new_arr = quick_sort(arr)
  
  
  until new_arr.length < 2
    i = new_arr.first
    j = new_arr.last

    case (i + j) <=> target_sum
      when -1
        new_arr.shift
      when 0 
        return true
      when 1
        new_arr.pop
      end 
  end
  false
end

def quick_sort(arr)
  return arr if arr.length < 2

  pivot = arr.first
  left, right = arr.drop(1).partition { |ele| ele < pivot }
  return quick_sort(left) + [pivot] + quick_sort(right)
end


def hash_map_two_sum(arr, target_sum)
  hash_map = Hash.new(false)

  arr.each do |num|
    return true if hash_map[num]
    hash_map[target_sum - num] = true
  end
  false
end
