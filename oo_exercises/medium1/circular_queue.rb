# when an object is added, it is added to the position that follows the most recently added objects
#keep track of the possition of the most recently added object

#removing an object,
# removes the object that has been in the queue the longest

#when adding to a full queue, the object that has been in the longest is removed and replaced by the new object.

=begin
cq class
initialized with buffer size

enqueqeue method - add an object to the queue
dequeue method - remove and return the oldest object in the queue, it should return nil if the quieue is empty.

=end

class CircularQueue
  def initialize(buffer_size)
    @queue = []
    @buffer_size = buffer_size
  end

  def enqueue(num)
    @queue.unshift(num)
    dequeue if @queue.size > @buffer_size
  end

  def dequeue
    @queue.pop
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil