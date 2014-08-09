def concat(string)
  string.inject { |result, single| result + " " + single }
end

p concat(["this", "is", "a", "test"])