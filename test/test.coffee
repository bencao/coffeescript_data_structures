module "Binomial Heap"

test "make heap", () ->
  heap = new BinomialHeap()
  equal(heap.head, null, "new heap should have a null head")
  ok(heap.is_empty(), "new heap should be empty")

test "make heap with custom head", () ->
  head = new BinomialHeapNode({}, -65535)
  heap = new BinomialHeap(head)
  deepEqual(heap.head, head, "new heap with a param should have a custom head")
  equal(heap.is_empty(), false, "new heap with a param should not be empty")

test "union", () ->
  heap1 = new BinomialHeap(new BinomialHeapNode({}, 123))
  heap2 = new BinomialHeap()

  deepEqual(heap1.union(heap2), heap1,
    "union heap with a empty heap will change nothing")
  deepEqual(heap2.union(heap1), heap1,
    "union empty heap with a non-empty heap will equal to the non-empty one")

  node3 = new BinomialHeapNode({}, 1)
  heap3 = new BinomialHeap(node3)
  node4 = new BinomialHeapNode({}, 2)
  heap4 = new BinomialHeap(node4)
  heap5 = heap3.union(heap4)
  deepEqual(heap5.head, node3, "1st node in union should now be head")
  deepEqual(heap5.head.child, node4,
    "2nd node in union with the same degree should be child")

test "insert", () ->
  node = new BinomialHeapNode({}, -65535)
  heap = new BinomialHeap()
  heap.insert(node)
  deepEqual(heap.head, node, "1st node inserted should be heap head")
  equal(heap.is_empty(), false, "a heap inserted something should not be empty")

  node2 = new BinomialHeapNode({}, 456)
  heap.insert(node2)
  deepEqual(heap.head.child, node2,
    "2nd inserted node should be the first child of head")

  node3 = new BinomialHeapNode({}, 123)
  heap.insert(node3)
  deepEqual(heap.head, node3,
    "3rd inserted node should become new head")
  deepEqual(heap.head.sibling, node,
    "after 3rd node inserted, 1st node inserted should be head's sibling")

test "minimum", () ->
  head = new BinomialHeapNode({}, -65535)
  heap = new BinomialHeap(head)
  heap.insert(new BinomialHeapNode({}, 123))
  equal(heap.min().key, -65535, "heap should return right minimum key")

test "extract_min", () ->
  node = new BinomialHeapNode({}, 1)
  heap = new BinomialHeap(node)
  node2 = new BinomialHeapNode({}, 6)
  heap.insert(node2)
  node3 = new BinomialHeapNode({}, 123)
  heap.insert(node3)
  node4 = new BinomialHeapNode({}, -5)
  heap.insert(node4)
  node5 = new BinomialHeapNode({}, -65535)
  heap.insert(node5)
  node6 = new BinomialHeapNode({}, 567)
  heap.insert(node6)
  node7 = new BinomialHeapNode({}, -65534)
  heap.insert(node7)
  node8 = new BinomialHeapNode({}, 0)
  heap.insert(node8)
  node9 = new BinomialHeapNode({}, 367)
  heap.insert(node9)
  node10 = new BinomialHeapNode({}, 234)
  heap.insert(node10)
  node11 = new BinomialHeapNode({}, -456)
  heap.insert(node11)
  node12 = new BinomialHeapNode({}, 65535)
  heap.insert(node12)

  deepEqual(heap.extract_min(), node5,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node7,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node11,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node4,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node8,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node2,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node3,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node10,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node9,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node6,
    "heap should correctly extract minimum node")
  deepEqual(heap.extract_min(), node12,
    "heap should correctly extract minimum node")

test "decrease_key", () ->
  node = new BinomialHeapNode({}, 1)
  heap = new BinomialHeap(node)
  node2 = new BinomialHeapNode({}, 6)
  heap.insert(node2)
  node3 = new BinomialHeapNode({}, 123)
  heap.insert(node3)
  node4 = new BinomialHeapNode({}, -5)
  heap.insert(node4)

  heap.decrease_key(node3, -456)

  deepEqual(heap.extract_min(), node3,
    "heap should correctly extract minimum node after decrease_key")
  deepEqual(heap.extract_min(), node4,
    "heap should correctly extract minimum node")

  heap.decrease_key(node, 0)

  deepEqual(heap.extract_min(), node,
    "heap should correctly extract minimum node after decrease_key")
  deepEqual(heap.extract_min(), node2,
    "heap should correctly extract minimum node")

test "delete", () ->
  node = new BinomialHeapNode({}, 1)
  heap = new BinomialHeap(node)
  node2 = new BinomialHeapNode({}, 6)
  heap.insert(node2)
  node3 = new BinomialHeapNode({}, 123)
  heap.insert(node3)
  node4 = new BinomialHeapNode({}, -5)
  heap.insert(node4)

  heap.delete(node4)
  heap.delete(node2)

  deepEqual(heap.extract_min(), node,
    "heap should correctly extract minimum node after delete")
  deepEqual(heap.extract_min(), node3,
    "heap should correctly extract minimum node after delete")
