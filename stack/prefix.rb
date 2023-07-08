require_relative './stack.rb'

$stack = Stack.new(100)

def precedence(op)
    if op == '+' or op == '-'
        return 1
    elsif op == '*' or op == '/'
        return 2
    elsif op == '^'
        return 3
    else
        return 0
    end
end

def to_prefix(src)
    expr = src.reverse
    num_chars = expr.length
    postfix = ""
    count = 0

    while count < num_chars
        char = expr[count]
        count += 1

        next if char.match?(' ')
        
        if char.match?(/[[:digit:]]/) or char.match?(/[[:alpha:]]/)
            postfix += char
        elsif char == '('
            $stack.push char
        elsif char == ')'
            while not $stack.is_empty? and not ($stack.peek == '(')
                postfix += $stack.pop
            end

            if $stack.peek == '('
                $stack.pop
            end
        else
            while not $stack.is_empty? and precedence(char) <= precedence($stack.peek) and not ($stack.peek == '(')
                postfix += $stack.pop
            end

            $stack.push char
        end
    end

    while not $stack.is_empty?
        c = $stack.pop

        if c == nil
            break
        else
            postfix += c
        end
    end

    puts "Infix: #{src} -> Postfix: #{postfix.reverse}"
end

# main
print "Write an infix expression: "

expression = gets.chomp

puts "\n"

to_prefix expression
