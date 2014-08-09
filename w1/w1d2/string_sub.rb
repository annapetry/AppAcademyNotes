def substring(str)
  result = []
  
  (str.length).times do |count|
    i = count + 1
    while i <= str.length
      result << str[count...i]
      i += 1
    end
  end
  result
end

def subwords(str)
  dictionary = []
  
  File.foreach("dictionary.txt") do |line|
    dictionary << line.chomp
  end
  substring(str).select { |sub| dictionary.include?(sub) }
end