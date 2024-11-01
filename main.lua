Queue = require "queue"
Object = require "classic"

Node = Object:extend()

function Node:new(name)
    self.name = name
    self.lst_neighbours = {}
    self.visited = false
end

function breadth_first_search(start)
    local queue = Queue()
    
    -- insert the first node in queue (will be the first taken out)
    queue:enqueue(start)

    -- keep interating (looking up for neighbours) until queue is empty
    while queue.empty == false do
        -- remove first/older item inserted in queue, we will consider its neighbours
        current_node = queue:dequeue()
        -- set the node to visited
        current_node.visited = true
        print(current_node.name)

        -- iterate through its adjacent nodes (neighbours)
        for idx, neighbour in ipairs(current_node.lst_neighbours) do
            -- if the adjacent nodes have not been visited yet, then insert them in queue
            if neighbour.visited == false then
                -- we set the node to visited
                neighbour.visited = true
                -- insert it intho the queue
                queue:enqueue(neighbour)
            end
        end
    end
end

-- TEST 
-- Create nodes with names
nodeA = Node('A')
nodeB = Node('B')
nodeC = Node('C')
nodeD = Node('D')
nodeE = Node('E')


table.insert(nodeA.lst_neighbours, nodeB)
table.insert(nodeA.lst_neighbours, nodeD)
table.insert(nodeB.lst_neighbours, nodeD)
table.insert(nodeD.lst_neighbours, nodeC)
table.insert(nodeD.lst_neighbours, nodeE)


breadth_first_search(nodeA)





