require 'debugger'

def remix(matrix)
  result = matrix.transpose
  result[1] = result[1].shuffle
  result.transpose
end