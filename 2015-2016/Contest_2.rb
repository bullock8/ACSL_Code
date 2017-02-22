def answer(thing)
  modded = thing.gsub(/\s+/, "").split(",")
  #number = modded[0].split(".")
  length = modded[1].to_i
  declen = modded[2].to_i
  number1 = modded[0].to_f.round(declen).to_s
  number = number1.split(".")
  numlen = number1.length
  num = number[0]
  dec = number[1]
  if modded[0].include?("+")
    num = "+" + num.to_s
    numlen += 1
  end
  if length -(declen + 1) < num.length
    str = "."
    declen.times do 
      str += "#"
    end
    while str.length != length
      str = "#" + str
    end
    return str
  elsif length > (numlen)
    if modded[0].include?("+")
      number1 = "+" + number1
    end
    (length - numlen).times do 
      number1 = "#" + number1
    end
    return number1
  else
    return num.to_s + "." + dec.to_s
  end
end
i1 = gets.strip
i2 = gets.strip
i3 = gets.strip
i4 = gets.strip
i5 = gets.strip
puts answer(i1)
puts answer(i2)
puts answer(i3)
puts answer(i4)
puts answer(i5)
