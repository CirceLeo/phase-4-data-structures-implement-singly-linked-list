require_relative './node'

class LinkedList

    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend node
        node.next_node = @head
        @head = node
    end

    def append node
        if head.nil?
            self.head = node
            return
        end

        last_node = head
        while last_node.next_node
            last_node = last_node.next_node
        end

        last_node.next_node = node
        
    end

    def delete_head
        if head.nil? 
            return
        end
        self.head = self.head.next_node
        # self.head.delete
    end

    def delete_tail

        if head.nil? 
            return
        end

        penultimate_node = head
        if !head.next_node
            self.head = nil
            return
        end

        while penultimate_node.next_node.next_node
            penultimate_node = penultimate_node.next_node
        end
        penultimate_node.next_node = nil

    end

    def add_after index, node
        counter = 0
        node_at_index = head
        while counter < index
            node_at_index = node_at_index.next_node
            counter = counter + 1
        end

        if node_at_index
            node.next_node = node_at_index.next_node
            node_at_index.next_node = node
        else
            append(node)
        end
    end

    def search value
        searched_node = self.head
        while searched_node.next_node
            if searched_node.data == value
                return searched_node
            end
            searched_node = searched_node.next_node
        end
    end
end
