#John Bullock

require 'bigdecimal'

input_1 = gets.strip
input_2 = gets.strip
input_3 = gets.strip
input_4 = gets.strip
input_5 = gets.strip

array_1 = input_1.split(", ")
array_2 = input_2.split(", ")
array_3 = input_3.split(", ")
array_4 = input_4.split(", ")
array_5 = input_5.split(", ")

big_array = [array_1, array_2, array_3, array_4, array_5]
@a = 0
@b = 450
@c = 590
@d = 710
@e = 1030
@f = 1280
@g = 1360
def mileage(x, y)
  if x == "A"
    @start = @a
  elsif x == "B"
    @start = @b
  elsif x == "C"
    @start = @c
  elsif x == "D"
    @start = @d
  elsif x == "E"
    @start = @e
  elsif x == "F"
    @start = @f
  else
    @start = @g
  end
  if y == "A"
    @finish = @a
  elsif y == "B"
    @finish = @b
  elsif y == "C"
    @finish = @c
  elsif y == "D"
    @finish = @d
  elsif y == "E"
    @finish = @e
  elsif y == "F"
    @finish = @f
  else
    @finish = @g
  end
  if @finish > @start
    return @finish - @start
  elsif @start > @finish
    return @start - @finish
  else
    return 0
  end
end
def time(a,b)
  if b == "I"
    @speed = 65
  elsif b == "H"
    @speed = 60
  elsif b == "M"
    @speed = 55
  else
    @speed = 45
  end
  hours = a / @speed
  a = BigDecimal(a)
  @speed = BigDecimal(@speed)
  minutes = ((a/@speed) - hours) * 60
  if hours >= 10
    if minutes > 9
      return "#{sprintf "%2.0f", hours}:#{sprintf "%2.0f", minutes}"
    else
      return "#{sprintf "%2.0f", hours}:#{0}#{sprintf "%1.0f", minutes}"
    end
  else
    if minutes > 9
      return "#{0}#{sprintf "%1.0f", hours}:#{sprintf "%2.0f", minutes}" #had this return a 0 in front of the hours to keep number of hours digits the same.
    else
      return "#{0}#{sprintf "%1.0f", hours}:#{0}#{sprintf "%1.0f", minutes}"
    end
  end
end
def gas_money(c,d,e)
  c = BigDecimal(c)
  e = BigDecimal(e.to_s)
  if d == "C"
    @mpg = 28
  elsif d == "M"
    @mpg = 25
  elsif d == "F"
    @mpg = 22
  else
    @mpg = 20
  end
  @mpg = BigDecimal(@mpg)
  gallons = c/@mpg
  price = gallons*e
  price = sprintf "%5.2f" , price
  return price
end
miles_1 = mileage(array_1[0], array_1[1])
puts "#{miles_1}, #{time(miles_1, array_1[3])}, $#{gas_money(miles_1, array_1[2], array_1[4])}"
mile = mileage(array_2[0], array_2[1])
puts "#{mile}, #{time(mile, array_2[3])}, $#{gas_money(mile, array_2[2], array_2[4])}"
miles = mileage(array_3[0], array_3[1])
puts "#{miles}, #{time(miles, array_3[3])}, $#{gas_money(miles, array_3[2], array_3[4])}"
miles_2 = mileage(array_4[0], array_4[1])
puts "#{miles_2}, #{time(miles_2, array_4[3])}, $#{gas_money(miles_2, array_4[2], array_4[4])}"
miles_3 = mileage(array_5[0], array_5[1])
puts "#{miles_3}, #{time(miles_3, array_5[3])}, $#{gas_money(miles_3, array_5[2], array_5[4])}"
