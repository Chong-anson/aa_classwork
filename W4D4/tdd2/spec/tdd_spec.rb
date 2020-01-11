require 'tdd'

describe "#my_uniq" do 
  it "should take in an array" do 
    expect{my_uniq('string')}.to raise_error(ArgumentError) 
  end 

  it "should return a unique array" do   
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3]) 
  end 
end 

describe Array do 
  describe "#two_sum" do 
    subject(:array){ array = [-1, 0, 2, -2, 1] }

    it "should take no arguments" do 
      expect{array.two_sum([0, 0])}.to raise_error(ArgumentError) 
    end 

    it "all elements should be integers" do 
      expect{[1,2,"a"].two_sum}.to  raise_error(TypeError)
    end 
    
    it "should find the pairs of indices that sum to zero" do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "should not count the same element twice" do 
      expect(array.two_sum).to_not include([1,1])
    end 

    it "should sort smaller index before bigger index" do
      expect(array.two_sum).to_not eq([[2, 3], [0, 4]]) 
    end 

  end 
end 

describe "#my_transpose" do 
  subject(:rows){ rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ] }

  let(:cols){ cols = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ] }


  it "should take a 2D array as arugment" do 
    expect{my_transpose([1,2,3,4])}.to raise_error(TypeError)
  end 

  it "should have only integers as elements" do
    expect{my_transpose([ ['a', 2] ])}.to raise_error(TypeError) 
  end 

  it "the input array should be a square array" do   
    expect{my_transpose([ [1, 3, 4], [3] ])}.to raise_error(ArgumentError) 
  end 
  
  it "should transpose the input array" do    
    expect(my_transpose(rows)).to eq(cols) 
  end   
end 

#[48,99,06,49,23,56,26,56,34]

describe "#stock_picker" do 
  it "should take an integer array of prices as an argument" do
    expect{stock_picker("a")}.to raise_error(ArgumentError)
    expect{stock_picker([1,2,"a"])}.to raise_error(ArgumentError)
  end 
end 

