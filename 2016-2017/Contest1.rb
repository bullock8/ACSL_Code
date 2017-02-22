i1 = gets.strip
i2 = gets.strip
i3 = gets.strip
i4 = gets.strip
i5 = gets.strip

def numberize(number)
  if number != "J" && number != "K" && number != "Q" && number != "T" && number != "A"
    return number.to_i
  else
    if number == "J"
      return 11
    elsif number == "K"
      return 13
    elsif number == "T"
      return 10
    elsif number == "A"
      return 1
    else
      return 12
    end
  end
end

def denumberize(number)
  if number != 10 && number != 11 && number != 13 && number != 12 && number != 1
    return number.to_s
  else
    if number == 11
      return "J"
    elsif number == 13
      return "K"
    elsif number == 10
      return "T"
    elsif number == 1
      return "A"
    else
      return "Q"
    end
  end
end

def sameSuit(dealer, opp)
  return opp.include?(dealer)
end

def lowest(oppSuit, oppNum)
  lowest = oppNum.max
  repeat = false
  index = 0
  ties = []
  0.upto(4) do |c|
    b = oppNum[c]
    if b < lowest
      lowest = b
      repeat = false
      index = c
      ties.push(c)
    elsif b == lowest
      repeat = true
      ties.push(c)
    end
  end
  if(repeat == false)
    suity = oppSuit[index]
    return denumberize(lowest) + suity
  else
    posSuits = []
    ties.each do |d|
      posSuits.push(oppSuit[d])
    end
    posSuits.sort!
    return denumberize(lowest) + posSuits[0]
  end
end

def cardSuit(dealSuit, dealNum, oppSuit, oppNum)
  possible = []
  0.upto(4) do |y|
    if oppSuit[y] == dealSuit
    possible.push(y)
    end
  end
  pos2 = []
  possible.each do |z|
    if dealNum < oppNum[z]
      pos2.push(oppNum[z])
    end
  end
  if pos2.length > 0
    pos2.sort!
    ans = pos2[0]
    return denumberize(ans) + dealSuit
  else
    lowest = oppNum[possible[0]]
    possible.each do |a|
      if oppNum[a] < lowest
        lowest = oppNum[a]
      end
    end
    return denumberize(lowest) + dealSuit
  end
end

def answer(input)
  ar1 = input.gsub(/\s/, "").split(",")
  dealer_array = ar1.delete_at(0).split("")
  d_number = numberize(dealer_array[0])
  d_suit = dealer_array[1]
  suit = []
  number = []
  0.upto(4) do |x|
    array = ar1[x].split("")
    suit[x] = array[1]
    number[x] = numberize(array[0])
  end
  if(sameSuit(d_suit, suit))
    puts cardSuit(d_suit, d_number, suit, number)
  else
    puts lowest(suit, number)
  end
end

answer(i1)
answer(i2)
answer(i3)
answer(i4)
answer(i5)
