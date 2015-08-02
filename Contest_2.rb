i_1 = gets.strip
i_2 = gets.strip
i_3 = gets.strip
i_4 = gets.strip
i_5 = gets.strip

#output 1
def output_1(x)
  ans1 = ""
  x.each_char do |y|
    if y != "(" and y != "'" and y != ")"
    ans1 += y
    end
  end
  ans1.reverse!
  return "'(#{ans1})"
end

#output 2

def output_2(x)
  x.each_char do |z|
    if z == "(" or z == "\'" or z == ")" or z == " "
    x.slice!(z)
    end
  end
  @letter = ""
  @count = []
  @ans2 = ""
  x.each_char do |a|
    if a == @letter or @letter == ""
      @count.push(a)
      @letter = a
    else
      @ans2 += "(#{@count.length} #{@letter}) "
      @count.clear
      @letter = a
    @count.push(a)
    end
  end
  @ans2 += "(#{@count.length} #{@letter})"
  @ans2 ="'(" + @ans2 + ")"
  return @ans2
end

#output 3

def output_3(x)
  x.each_char do |z|
    if z == "(" or z == "\'" or z == ")" or z == " "
    x.slice!(z)
    end
  end
  @letter = ""
  @count = []
  @ans3 = ""
  x.each_char do |a|
    if a == @letter or @letter == ""
      @count.push(a)
      @letter = a
    else
      if @count.length > 1
        @ans3 += "(#{@count.length} #{@letter}) "
      else
        @ans3 += "#{@letter} "
      end
      @count.clear
      @letter = a
    @count.push(a)
    end
  end
  if @count.length > 1
    @ans3 += "(#{@count.length} #{@letter}) "
  else
    @ans3 += "#{@letter} "
  end
  @ans3 ="'(#{@ans3})"
  return @ans3
end

#output 4

def output_4(x)
  x = x.split(") (")
  x.each do |y|
    y.each_char do |z|
      if z == "(" or z == "\'" or z == ")" or z == " "
      y.slice!(z)
      end
    end
  end
  @last = (x.last).split(//).last
  @last = @last.to_i
  right = x.last
  x.pop
  right = right.split(//).first(2).join
  x.push(right)
  (x.length).downto(1) do |unicorn|
    if unicorn % @last == 0
    x.delete_at(unicorn - 1)
    end
  end
  @ans4 = "\'("
  x.each do |h|
    h = h.split(//).insert(1," ").join
    @ans4 += "(#{h}) "
  end
  @ans4 = @ans4 + "#{@last})"
  return @ans4
end

#output 5

def output_5(x)
  x = x.split(") (")
  x.each do |y|
    y.each_char do |z|
      if z == "(" or z == "\'" or z == ")" or z == " "
      y.slice!(z)
      end
    end
  end
  @last = (x.last).split(//).last
  right = x.last
  x.pop
  right = right.split(//).first(2).join
  x.push(right)
  y = []
  @ans5 = "\'("
  @count = 1
  x.each do |h|
    h = h.split(//).insert(1," ").join
    if @count == @last
      y.push("(#{h})")
    else
      y.push("(#{h}) ")
    end
    @count += 1
  end
  @ans5 += "#{y.first(@last.to_i).join.strip})\'(#{y.last(y.length - @last.to_i).join}#{@last})"
  return @ans5
end

puts output_1(i_1)
puts output_2(i_2)
puts output_3(i_3)
puts output_4(i_4)
puts output_5(i_5)
