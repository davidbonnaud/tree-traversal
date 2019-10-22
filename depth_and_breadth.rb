class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

def dfs(head, val)
  if head.payload == val
    puts true
  elsif !head
    puts false
  end
  
  head.children.each do |child|
    dfs(child, val)
  end

end

def bfs(head, val)
  queue = [head]

  while queue.length > 0
    cur_val = queue.shift
    if cur_val && val == cur_val.payload
      puts true
    end
    if cur_val
      cur_val.children.each do |child|
        queue.push(child)
      end
    end
  end

end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

puts dfs(trunk, 11)
puts dfs(trunk, 88)
puts bfs(trunk, 11)
puts bfs(trunk, 88)