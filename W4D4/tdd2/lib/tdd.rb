def my_uniq(array) 
  raise ArgumentError if !array.is_a?(Array) 
  result = [] 

  array.each do |el| 
    result << el if !result.include?(el)
  end   

  result 
end 

class Array  
  def two_sum 
    raise TypeError unless self.all? {|ele| ele.is_a?(Integer)}
    result = [] 
    
    self.each_with_index do | ele1, i | 
      self.each_with_index do | ele2, j | 
        result << [i,j] if ele1 + ele2 == 0 && j > i
      end 
    end 

    result
  end 
  
end 

def my_transpose(arrays)
  raise TypeError unless arrays.all?{ |el| el.is_a?(Array) } 
  raise TypeError unless arrays.all?{ |sub| sub.all?{ |el| el.is_a?(Integer) } } 
  raise ArgumentError unless arrays.all?{ |sub| arrays[0].length == sub.length } 
  result = [] 

  (0...arrays.length).each do |i| 
    new_array = [] 

    (0...arrays.length).each do |j| 
      new_array << arrays[j][i] 
    end 

    result << new_array 
  end 

  result 
end 

def stock_picker(array)
  raise ArgumentError unless array.is_a?(Array)
  raise ArgumentError unless array.all?{ |el| el.is_a?(Integer)}

end 
