begin
  load 'stacks_n_queues.rb'
  a = StackQueue.new
  a.enqueue(1)
  a.enqueue(2)
  a.enqueue(3)
end

begin
  load 'windows.rb'
  optimized_window([1,2,3,5],3)
end
