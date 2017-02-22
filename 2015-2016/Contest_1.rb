def theNumbers(array) 
  num1 = array[1]
  num1 = num1.to_i.to_s(2)
  while num1.length < 3
    num1 = "0" + num1
  end
  num2 = array[2].to_i.to_s(2)
  while num2.length < 3
    num2 = "0" + num2
  end
  num3 = array[3].to_i.to_s(2)
  while num3.length < 3
    num3 = "0" + num3
  end
  return "#{num1} #{num2} #{num3}"
end
def letterize(array, index, letter)
  array2 = array[index]
  array2 = array2.to_i.to_s(2)
  while array2.length < 3
    array2 = "0" + array2
  end
  array2 = array2.split("")
  words = ""
  if array2[0] == "1"
    words = "r"
  else
    words = "-"
  end
  if array2[1] == "1"
    words = words + "w"
  else
    words = words + "-"
  end
  if array2[2] == "1"
  words = words + letter
  else
    words = words + "-"
  end
  return words
end
def theanswer(array)
  line1 = theNumbers(array)
  if array[0].to_i == 0
    line2 = "#{letterize(array, 1, "x")} #{letterize(array,2,"x")} #{letterize(array,3,"x")}"
  elsif array[0].to_i == 1
    line2 = "#{letterize(array, 1, "s")} #{letterize(array,2,"x")} #{letterize(array,3,"x")}"
  elsif array[0].to_i == 2
    line2 = "#{letterize(array, 1, "x")} #{letterize(array,2,"s")} #{letterize(array,3,"x")}"
  else
    line2 = "#{letterize(array, 1, "x")} #{letterize(array,2,"x")} #{letterize(array,3,"t")}"
  end
  return line1 + " and " + line2
end
i1 = gets.strip
i2 = gets.strip
i3 = gets.strip
i4 = gets.strip
i5 = gets.strip
ar1 = i1.gsub(/\s+/, "").split(",")
ar2 = i2.gsub(/\s+/, "").split(",")
ar3 = i3.gsub(/\s+/, "").split(",")
ar4 = i4.gsub(/\s+/, "").split(",")
ar5 = i5.gsub(/\s+/, "").split(",")
puts theanswer(ar1)
puts theanswer(ar2)
puts theanswer(ar3)
puts theanswer(ar4)
puts theanswer(ar5)