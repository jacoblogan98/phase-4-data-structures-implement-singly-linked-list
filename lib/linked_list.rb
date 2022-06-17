require_relative './node'

class LinkedList
    attr_accessor :head
    
    def initialize
        @head = nil
    end

    def prepend(node)
        node.next_node = head
        self.head = node
    end

    def append(node)
        if head.nil?
            self.head = node
        else
            last_node = head
            while last_node.next_node
                last_node = last_node.next_node
            end

            last_node.next_node = node
        end
    end

    def delete_head
        return unless head

        self.head = self.head.next_node
    end

    def delete_tail
        return unless head
        return delete_head if head.next_node.nil?
        
        curr_node = head
        prev_node = nil

        while curr_node.next_node
            prev_node = curr_node
            curr_node = curr_node.next_node
        end

        prev_node.next_node = nil
    end

    def add_after(index, node)
        return prepend(node) if index == 0

        curr_index = 0
        curr_node = head
        
        while curr_index < index
            curr_index += 1
            curr_node = curr_node.next_node
        end

        if curr_node
            node.next_node = curr_node.next_node
            curr_node.next_node = node
        else 
            append(node)
        end

    end

    def search(value)
        curr_node = head

        until curr_node.data == value
            curr_node = curr_node.next_node
        end

        curr_node
    end
end
