import UIKit

// MARK: - Задача 2

protocol Container {
    associatedtype Item
    
    func count() -> Int
    mutating func add(_ element: Item)
    mutating func getItem(at index: Int) -> Item?
}

// MARK: -  Doubly linked list

class Node<T> {
    var nextNode: Node?
    var previousNode: Node?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
}

struct LinkedList<T>: Container {
    typealias Item = T
    
    var head: Node<Item>?
    
    func count() -> Int {
        var currentHead: Node? = head
        var count: Int = 0
        
        if currentHead == nil {
            return count
        }
        
        while currentHead != nil {
            count += 1
            currentHead = currentHead?.nextNode
        }
        
        return count
    }
    
    mutating func add(_ element: Item) {
        let node = Node(element)
        if head == nil {
            self.head = node
        } else {
            node.nextNode = head
            head?.previousNode = node
            self.head = node
        }
    }
    
    mutating func getItem(at index: Int) -> Item? {
        var currentPointer: Node? = head
        for _ in 0..<index {
            currentPointer = currentPointer?.nextNode
        }
        return currentPointer?.value
    }
}

// MARK: - Queue

struct Queue<T>: Container {
    
    typealias Item = T
    
    var list = LinkedList<Item>()
    
    var head: Node<T>?
    
    func count() -> Int {
        return list.count()
    }
    
    mutating func add(_ element: T) {
        list.add(element)
        if head == nil {
            head = list.head
        }
    }
    
    mutating func getItem(at index: Int) -> T? {
        var currentPointer: Node? = head
        for _ in 0..<index {
            currentPointer = head?.previousNode
        }
        return currentPointer?.value
    }
}

var myList = LinkedList<Int>()

myList.add(1)
myList.add(2)
myList.add(3)

myList.count()
myList.getItem(at: 1)

var myQueue = Queue<Int>()

myQueue.add(1)
myQueue.add(2)
myQueue.add(3)

myQueue.count()
myQueue.getItem(at: 1)
