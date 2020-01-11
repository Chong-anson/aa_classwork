require "byebug"

def search(array)
  temp = 0 
  (0...array.length).each do | i | 
    temp = array[i]
    (0...array.length).each do | j | 
      break if array[j] < temp
      if (j == array.length - 1) && array[j] > temp
        return i
      end 
    end 
  end 
  nil
end 

# p search([5,4,4,5])
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p  search(list)  # =>  -5

def search_2(arr)
  arr.inject do |min, el|
    if el < min 
      el
    else
      min
    end
  end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p  search_2(list)  # =>  -5

def l_sum(arr)
  pairs = []

  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      pairs << arr[i..j]
    end
  end
  pairs.inject(pairs.first.sum) do |acc, el|
    acc < el.sum ? el.sum : acc
  end
  
end

list = [2, 3, -6, 7, -6, 7, -2, 90]
# list2 = [-5, -1, -3]
# p l_sum(list)
# p l_sum(list2)

# 2 
# 2 3 => 5
# 2 3 -6 => -1 

def l_sum2(arr)
  return arr.max if arr.all? { |el| el < 0 }

  largest_sum = 0
  current_sum = 0
  i = 0

  while i < arr.length
    temp = arr[i] 
    if current_sum + temp > 0
      current_sum += temp
    else
      current_sum = 0
    end 
    if current_sum > largest_sum 
      largest_sum = current_sum
    end 
    i += 1
  end
  largest_sum
end

p l_sum2(list)