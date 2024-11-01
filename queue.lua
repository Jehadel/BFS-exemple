-- This module implements a Queue class that behave like a queue
-- inspired from the book « Programming in Lua » https://www.lua.org/pil/11.4.html

Object = require 'classic'

Queue = Object:extend()

function Queue:new()
  self.first = 0
  self.last = -1
  self.data = {} 
  self.empty = true
end

function Queue:enqueue(value)
    self.last = self.last + 1
    self.data[self.last] = value
    self.empty = false
end

function Queue:dequeue()
    local value
    if self.first > self.last then
        error('list is empty')
    else
        value = self.data[self.first]
        self.data[self.first] = nil
        self.first = self.first + 1
        if self.first > self.last then
            self.empty = true
        end
    end
    return value
end

--[[test 
queue = Queue()
print('enqueue A')
queue:enqueue('A')
print('enqueue B')
queue:enqueue('B')
print('enqueue C')
queue:enqueue('C')

print('Elements enqueued:')
for i = 0, #queue.data do
    print(queue.data[i])
end
print('queue.first', queue.first)
print('queue.last', queue.last)
print('queue empty', queue.empty)


repeat
    local x = queue.data[queue.first]
    print('dequeue ', x)
    print(queue:dequeue(), 'dequeued')
until (queue.first > queue.last)
print('queue.first', queue.first)
print('queue.last', queue.last)
print('queue empty', queue.empty)


print('Elements enqueued:')
for i = 0, #queue.data do
    print(queue.data[i])
end

queue:enqueue('A')
print(queue.data[queue.first])
print(queue.data[queue.last])
print(#queue.data)
print('queue empty', queue.empty)


queue:dequeue()
print(queue.data[queue.first])
print(queue.data[queue.last])
print(#queue.data)
print('queue.first', queue.first)
print('queue.last', queue.last)
print('queue empty', queue.empty)
--]]

return Queue 