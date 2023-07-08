class Stack
    def initialize(size)
        @stack = Array.new(size)
        @capacity = size
        @top = -1
    end

    def is_empty?
        @top == -1
    end

    def is_full?
        @top == @capacity - 1
    end

    def peek(index = 0)
        if self.is_empty?
            return nil
        else
            return @stack[@top + index]
        end
    end

    def push(item)
        if self.is_full?
            puts "Cannot push, stack is full"
            exit 1
        else
            @top += 1
            @stack[@top] = item
        end
    end

    def pop
        if self.is_empty?
            puts "Cannot pop, stack is empty"
            exit(1)
        else
            value = @stack[@top]
            @top -= 1
            return value
        end
    end
end