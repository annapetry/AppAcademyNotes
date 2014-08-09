require 'debugger'

def num_to_s(num, base)
  pow = 1
  result = []
  
  num_hash = {
    0 => '0',
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',   
    10 => 'A',
    11 => 'B',
    12 => 'C',
    13 => 'D',
    14 => 'E',
    15 => 'F'
  }

  until num/(base ** pow) == 0
    # debugger
    result.push(num_hash[(num/pow) % base])
    pow = pow * base
    num = num - ((num/pow) % base)
    
  end

  result.join
end

p num_to_s(5, 2)
p num_to_s(234, 10)