def cipher(string, shift)
  string_ascii_vals = []
  result = []
  coded = []
  shifted = 0
  
  ascii_vals = ("a".."z").to_a.map(&:ord)
  
  string.split("").each do |char|
    string_ascii_vals << char.ord
  end
  
  string_ascii_vals.each do |val|
    value = ascii_vals.find_index(val)
    shifted =  value + shift

    
    if shifted >= 26
      until shifted < 26
        shifted = shifted - 26
      end
    end
      
    result << ascii_vals[shifted]
      
  end
  


  result.each do |char|
    coded << char.to_i.chr
  end

  coded.join

end

puts cipher("hello", 3)
puts cipher("xyz", 4)

 