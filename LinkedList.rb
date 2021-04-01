require_relative 'Node.rb'

class LinkedList

    attr_accessor :head, :tail, :size

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def append(value)
        if @tail.nil? 
            @tail = Node.new(value)
            @head = @tail        
        else
            @tail.next_node = Node.new(value)
            @tail = @tail.next_node                 
        end  

        @size += 1

    end

    def prepend(value) 
        if @head.nil?       
            @head = Node.new(value) 
            @tail = @head
        else
            temp = Node.new(value)
            temp.next_node = @head
            @head = temp
        end 

        @size += 1
    end

    def at(index)
        puts "Index starts at 0."
        temp = @head
        count = -1
        return nil if index > @size
        until temp.nil?
          count += 1
          return temp.value if count == index        
          temp = temp.next_node
        end        
        count
    end

    def pop
        temp = @head        
        temp = temp.next_node until temp.next_node == @tail            
        temp.next_node = nil
        @tail = temp    
    end

    def contains?(value)
        temp = @head

        until temp.nil?            
            return true if temp.value == value 
            temp = temp.next_node  
        end

        false
    end

    def find(value)
        puts "Index starts at 0."
        temp = @head
        count = -1        
        until temp.nil?
          count += 1
          return count if temp.value == value       
          temp = temp.next_node
        end        
        nil

    end
    
    def to_s
        temp = @head
        until temp.nil?
          print "( #{temp.value} ) -> "
          temp = temp.next_node
        end
        
    end

end

list = LinkedList.new
list.append(7)
list.append(5)
list.append(23)
list.append(34)
list.append(56)
list.append(17)
p list.to_s
p list.contains?(3)
p list.find(2)