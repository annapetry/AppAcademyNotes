puts "Enter filename:"
filename = gets.chomp

file_array = File.readlines(filename)

filename = (filename.split("."))[0].to_s

file_shuffle = file_array.shuffle

File.open("#{filename}-shuffled.txt", "w") do |f|
  f.puts file_shuffle
end