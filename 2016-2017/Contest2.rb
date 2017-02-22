i1 = gets.strip
i2 = gets.strip
i3 = gets.strip
i4 = gets.strip
i5 = gets.strip

def format(thing)
  array = thing.gsub(/\s+/, "").split("")
end

def loop(array, lastNum)
  newNum = array.delete_at(0)
  while(newNum.to_i <= lastNum)
    if(array[0] == nil)
      return -1
    else
      newNum += array.delete_at(0)
    end
  end
  return newNum.to_i
end

def answer(array)
  string = array.delete_at(0) + " "
  lastNum = string.to_i
  array.reverse!
  newNum = loop(array, lastNum)
  while(newNum != -1)
    string += newNum.to_s + " "
    array.reverse!
    lastNum = newNum
    newNum = loop(array, lastNum)
  end
  return string
end

puts answer(format(i1))
puts answer(format(i2))
puts answer(format(i3))
puts answer(format(i4))
puts answer(format(i5))