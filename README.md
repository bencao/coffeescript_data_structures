coffeescript_data_structures
============================

data structures coffee script implementation, currently contains binomial heap

## Binomial Heap

### Usage
```coffeescript
# API
# new BinomialHeapNode(satellite_data, key)
# new BinomialHeap(head_node=null)
# heap.insert(node)
# heap.delete(node)
# heap.extract_min()
# heap.decrease_key(node, new_key)
# heap.is_empty()

heap = new BinomialHeap()
node = new BinomialHeapNode({}, 1)
heap.insert(node)
node2 = new BinomialHeapNode({}, 6)
heap.insert(node2)
node3 = new BinomialHeapNode({}, 123)
heap.insert(node3)
node4 = new BinomialHeapNode({}, -5)
heap.insert(node4)
node5 = new BinomialHeapNode({}, -65535)

heap.extract_min() # return node5
heap.extract_min() # return node4
heap.decrease_key(node2, 0) # node2 now has key 0
heap.extract_min() # should == node2 because node2 now has key 0
heap.delete(node)
heap.extract_min() # should == node3 because node was deleted

heap.is_empty() # true
```
