def answer(i1)
  ar1 = i1.gsub(/\s+/, "").split(",")
  board = [["abc", "abc", "abc", "abc"], ["abc", "abc", "abc", "abc"], ["abc", "abc", "abc", "abc"], ["abc", "abc", "abc", "abc"]]
  blockers = [ar1[0].to_i, ar1[1].to_i, ar1[2].to_i, ar1[3].to_i]
  blockers.each do |thing|
    board[(thing / 6) - 1][(thing % 6) - 2] = "x"
  end
  ar1.delete_at(4)
  ar1.delete_at(3)
  ar1.delete_at(2)
  ar1.delete_at(1)
  ar1.delete_at(0)
  bool = 0
  hash = {}
  ar1.each do |cena|
    if bool % 2 == 0
    hash[ar1[bool + 1].to_i] = cena
    end
    bool += 1
  end
  hash.each do |x,y|
    if x % 6 == 1
      if board[(x/6) - 1][0]  != "x"
        board[(x/6) - 1][0] = y
      else
        board[(x/6) - 1][1] = y
      end
    elsif x % 6 == 0
      if board[(x/6) - 2][3] != "x"
        board[(x/6) - 2][3] = y
      else
        board[(x/6) - 2][2] = y
      end
    elsif x / 6 == 0
      if board[0][(x % 6) - 2] != "x"
        board[0][(x % 6) - 2] = y
      else
        board[1][(x % 6) - 2] = y
      end
    else
      if board[3][(x % 6) - 2] != "x"
        board[3][(x % 6) - 2] = y
      else
        board[2][(x % 6) - 2] = y
      end
    end
  end
  return board
end
def simplify(array)
  while (array[0].join("") + array[1].join("") + array[2].join("") + array[3].join("")).length != 16
    0.upto(3) do |x|
      0.upto(3) do |y|
        if array[x][y].length == 1  && array[x][y] != "x"
          array[x][y] = array[x][y].upcase
          string = ""
          array[x].each do |a|
            a.slice!(array[x][y].downcase)
            string += a
          end
        end
      end
    end
    0.upto(3) do |col|
      0.upto(3) do |row|
        thing = array[row][col]
        if thing.length == 1 && thing != "x"
          array[row][col] = thing.upcase
          0.upto(3) do |column|
            array[column][col].slice!(thing.downcase)
          end
        end
      end
    end
    0.upto(3) do |a|
      0.upto(3) do |b|
        if array[a][b].length == 1 && array[a][b] != "x"
        array[a][b] = array[a][b].upcase
        end
      end
    end
  end
  return array
end
def niceprint(array)
  string = ""
  array.each do |x|
    x.each do |y|
      if y.downcase != "x"
        string += y.upcase
      end
    end
  end
  puts string
end
i1 = gets.strip
i2 = gets.strip
i3 = gets.strip
i4 = gets.strip
i5 = gets.strip
niceprint(simplify(answer(i1)))
niceprint(simplify(answer(i2)))
niceprint(simplify(answer(i3)))
niceprint(simplify(answer(i4)))
niceprint(simplify(answer(i5)))