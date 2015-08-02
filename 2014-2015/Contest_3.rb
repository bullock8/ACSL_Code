#Contest 3 2015
i_1 = gets.strip
i_2 = gets.strip
i_3 = gets.strip
i_4 = gets.strip
i_5 = gets.strip

def answer(x)
  x = x.split(",")
  board = [[1,2,3,4,5,6,7],[8,9,10,11,12,13,14],[15,16,17,18,19,20,21],[22,23,24,25,26,27,28],[29,30,31,32,33,34,35],[36,37,38,39,40,41,42],[43,44,45,46,47,48,49]]
  #use modulus and integer division to find out which array element
  start = x[1].to_i
  saver = x[1].to_i
  x.delete(start.to_s)
  x.delete(0)
  x.each do |y|
    y = y.to_i
    if y / 7.0 == y / 7
    array_1 = y / 7 - 1
    else
    array_1 = y / 7
    end
    if y % 7 == 0
    array_2 = 6
    else
    array_2 = y % 7 - 1
    end
    sub_array = board[array_1]
    sub_array[array_2] = 0
  end
  array1 = []
  if start / 7 == start/7.0
    @row = (start / 7) - 1
  else
    @row = start / 7
  end
  save = @row
  while @row + 1 <= 6
    if board[@row + 1].include?(start + 8)
    start += 8
    array1.push(start)
    else
      @row = 7
    end
  end
  start = saver
  @row = save
  array2 = []
  while @row + 1 <= 6
    if board[@row + 1].include?(start + 7)
      start += 7
      array2.push(start)
      @row += 1
    else
      @row = 7
    end
  end
  start = saver
  @row = save
  array3 = []
  while board[@row].include?(start + 1)
    start += 1
    array3.push(start)
  end
  start = saver
  @row = save
  array4 = []
  while board[@row].include?(start-1)
    start -= 1
    array4.push(start)
  end
  start = saver
  @row = save
  array5 = []
  while @row - 1 >= 0
    if board[@row - 1].include?(start-7)
      start -= 7
      array5.push(start)
      @row -= 1
    else
      @row = -1
    end
  end
  start = saver
  @row = save
  array6 = []
  while @row - 1 >= 0
    if board[@row - 1].include?(start-8)
      start -= 8
      array6.push(start)
      @row -= 1
    else
      @row = -1
    end
  end
  start = saver
  @row = save
  array7 = []
  while @row + 1 <= 6
    if board[@row + 1].include?(start + 6)
      start += 6
      array7.push(start)
      @row  += 1
    else
      @row = 7
    end
  end
  start = saver
  @row = save
  array8 = []
  while @row - 1 >= 0
    if board[@row - 1].include?(start - 6)
      start -= 6
      array8.push(start)
      @row -= 1
    else
      @row = -1
    end
  end
  big_array = [array1,array2,array3,array4,array5,array6,array7,array8]
  @greatest = []
  big_array.each do |j|
    if j.length > @greatest.length
      @greatest = j
    end
  end
  if @greatest.length == 0
    puts "NONE"
  else
    @string = ""
    @greatest.each do |b|
      if @string == ""
        @string = "#{b}"
      else
        @string += ",#{b}"
      end
    end
    puts @string
  end
end

answer(i_1)
answer(i_2)
answer(i_3)
answer(i_4)
answer(i_5)
