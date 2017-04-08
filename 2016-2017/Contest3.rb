def hexIt(num)
  ans = ""
  num.each_char do |x|
    newx = x.hex.to_s(2)
    while newx.length != 4
      newx = "0" + newx
    end
    ans = ans + newx
  end
  return ans
end

def chunk(string, size)
  string.scan(/.{1,#{size}}/)
end

def boardify(input)
  board = input.scan(/.{1,8}/)
  0.upto(7) do |x|
    board[x] = board[x].split("")
  end
  return board
end

i1 = boardify(hexIt(gets.strip.gsub(/\s+/, "")))
i2 = boardify(hexIt(gets.strip.gsub(/\s+/, "")))
i3 = boardify(hexIt(gets.strip.gsub(/\s+/, "")))
i4 = boardify(hexIt(gets.strip.gsub(/\s+/, "")))
i5 = boardify(hexIt(gets.strip.gsub(/\s+/, "")))
i6 = boardify(hexIt(gets.strip.gsub(/\s+/, "")))


def changeboard(original, row, col)
  changers = [[row, col]]
  if row>2
    changers.push([row-2, col], [row - 1, col])
  elsif row > 1
    changers.push([row-1, col])
  end
  if row <7
    changers.push([row+2, col], [row + 1, col])
  elsif row < 8
    changers.push([row + 1, col])
  end
  if col >2
    changers.push([row, col -2], [row, col - 1])
  elsif col > 1
    changers.push([row, col - 1])
  end
  if col < 7
    changers.push([row, col + 2], [row, col+1])
  elsif col < 8
    changers.push([row, col+1])
  end
  if row > 1 && col > 1
    changers.push([row - 1, col - 1])
  end
  if row < 8 && col < 8
    changers.push([row + 1, col + 1])
  end
  if row > 1 && col < 8
    changers.push([row - 1, col + 1])
  end
  if row < 8 && col > 1
    changers.push([row + 1, col - 1])
  end
  thing = original
  changers.each do |x|
    if thing[x[0]-1][x[1]-1] == "1"
      thing[x[0]-1][x[1]-1] = "0"
    else
      thing[x[0]-1][x[1]-1] = "1"
    end
  end
  return thing
end

def answer(old, final)
  1.upto(8) do |r|
    1.upto(8) do |c|
      if changeboard(old, r,c) == final
        return "#{r}#{c}"
      else
        changeboard(old, r, c)
      end
    end
  end
end

puts answer(i1, i2)
puts answer(i2, i3)
puts answer(i3, i4)
puts answer(i4, i5)
puts answer(i5, i6)

