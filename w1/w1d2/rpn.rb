class RPN
  def initialize
    @stack = []
  end
  
  def run(file)
    operators = %w{+ - * /}

    file.each do |entry|
      break if entry.chomp == "q"
      if operators.include?(entry.chomp)
        determine(entry.chomp)
      else
        @stack << entry.to_i
      end
      puts "Stack is: #{@stack}"
    end
  end

  def determine(entry)
    if @stack.length >= 2
      case entry
      when "+"
        add
      when "-"
        subtract
      when "*"
        multiply
      when "/"
        divide
      end
    else
      puts "Insufficient entries in stack"
    end
  end
  
  def add
    num1 = @stack.pop
    num2 = @stack.pop
    @stack << num1 + num2
  end

  def subtract
    num1 = @stack.pop
    num2 = @stack.pop
    @stack << num2 - num1
  end
  
  def multiply
    num1 = @stack.pop
    num2 = @stack.pop
    @stack << num1 * num2
  end
  
  def divide
    num1 = @stack.pop
    num2 = @stack.pop
    @stack << num1 / num2
  end

end

if __FILE__ == $PROGRAM_NAME

  if ARGV[0]
    contents = File.readlines(ARGV[0])
    RPN.new.run(contents)
  else
    RPN.new.run($stdin)
  end

end

