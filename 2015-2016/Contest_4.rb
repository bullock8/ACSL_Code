def format(i1)
  ar1 = i1.gsub(/\s+/, "").split(",")
  0.upto(ar1.length - 1) do |x|
    if ar1[x] == "#"
      ar1[x] = ""
    end
  end
  return ar1
end
def compare(regex, array)
  array2 = []
  array.each do |x|
    if /^#{regex}$/.match(x) != nil
      array2.push(x)
    end
  end
  return array2
end
def printer(array)
  thing = true
  if array.length == 0
    @string = "NONE"
  else
    array.each do |x|
      if thing
        @string = array[0]
        thing = false
      else
        @string = "#{@string}, #{x} "
      end
    end
  end
  puts @string
end
dab = gets.strip
on = gets.strip
em = gets.strip
bird = gets.strip
is = gets.strip
the = gets.strip
word = format(dab)
printer(compare(on, word))
printer(compare(em, word))
printer(compare(bird, word))
printer(compare(is, word))
printer(compare(the, word))
