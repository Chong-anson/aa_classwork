def first_anagram(str1, str2)
  arr = str1.split("").permutation
  arr.map { |el| el.join("") }
  arr.include?(str2)
end

# first_anagram("apple", "pplea")


def second_anagram(str1, str2)
  arr1 = str1.split("")
  arr2 = str2.split("")

  arr1.each do |char|
    if arr2.include?(char)
      index = arr2.index(char)
      arr2.delete_at(index)
    end
  end
  arr2.empty?
end

# p second_anagram("apple", "pplea")

def third_anagram(str1, str2)
  str1.chars.sort == str2.chars.sort
end
p third_anagram("apple", "pplea")

def fourth_anagram(str1,str2)
  count(str1) == count(str2)
end 

def count(str)
  hash = Hash.new(0)

  str.each_char { |char| hash[char] += 1 }
  hash
end 

p fourth_anagram("apple", "pplea")
