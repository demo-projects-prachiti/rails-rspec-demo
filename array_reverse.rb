 list = [12,11,56]
  n = list.length   
  puts "length is #{n}"
  loop do
    swapped = false
    (n-1).times do |i|
      puts "i is #{i}"
      if list[i] > list[i+1]
        list[i], list[i+1] = list[i+1], list[i]
        swapped = true
      end
    end
    break if not swapped  
  end   
  print list 