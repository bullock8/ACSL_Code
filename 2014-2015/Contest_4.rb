i1 = gets.strip
i2 = gets.strip
i3 = gets.strip
i4 = gets.strip
i5 = gets.strip
i6 = gets.strip

def alg(y)
  a1 = y.split(', ')
  a2 = []
  a1.each do |x|
    binary = x.to_i.to_s(2)
    while binary.length < 4
      binary = "0" + binary
    end
    a2.push(binary)
  end
  a3 = []
  a2.each do |x|
    a3.push(x.split(//))
  end
  first = []
  second = []
  third = []
  fourth = []
  a3.each do |x|
    first.push(x[0])
    second.push(x[1])
    third.push(x[2])
    fourth.push(x[3])
  end
  string = ""
  first.uniq!
  letter = ""
  if first.length == 1
    string = first[0]
    if string == "1"
      letter = "A"
    elsif string == "0"
      letter = "a"
    end
  else
    string = "x"
  end
  second.uniq!
  if second.length == 1
    string = string + second[0]
    if second[0] == "1"
      letter = letter + "B"
    elsif second[0] == "0"
      letter = letter + "b"
    end
  else
    string = string + "x"
  end
  third.uniq!
  if third.length == 1
    string = string + third[0]
    if third[0] == "1"
      letter = letter + "C"
    elsif third[0] == "0"
      letter = letter + "c"
    end
  else
    string = string + "x"
  end
  fourth.uniq!
  if fourth.length == 1
    string = string + fourth[0]
    if fourth[0] == "1"
      letter = letter + "D"
    elsif fourth[0] == "0"
      letter = letter + "d"
    end
  else
    string = string + "x"
  end
  if string != "xxxx"
    puts "#{string}, #{letter}"
  else
    puts "NONE"
  end
end

alg(i2)
alg(i3)
alg(i4)
alg(i5)
alg(i6)
