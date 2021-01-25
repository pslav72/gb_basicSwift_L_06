import UIKit

struct Queue<T> {
    private var array: [T] = []
    
    subscript(idx: Int) -> T? {
        get {
            return self.array.indices ~= idx ? self.array[idx] : nil
        }
        set {
            guard newValue != nil else { return }
            guard self.array.indices ~= idx else { return }
            return self.array[idx] = newValue!
        }
    }
    
    mutating func addToQueue(_ element: T) {
        self.array.append(element)
    }
    
    mutating func removeFirstFromQueue() -> T {
        return self.array.removeFirst()
    }
    
    
    mutating func removeElement(where condition: (T) -> Bool) {
        for (index, element) in array.enumerated().reversed() {
            if condition(element) {
                array.remove(at: index)
            }
        }
    
    }

    mutating func removeValue(where condition: (T, T) -> Bool, removeValue value: T) {
        for (index, element) in array.enumerated().reversed() {
            if condition(element, value) {
                array.remove(at: index)
            }
        }
    }
    
}

let removeValue: (Int, Int) -> Bool = { (element: Int, value: Int) -> Bool in
    return element == value
}

var queue = Queue<Int>()
queue.addToQueue(5)
queue.addToQueue(7)
queue.addToQueue(3)
queue.addToQueue(8)
queue.addToQueue(15)
print("View queue")
print(queue)
print("Remove first value")
queue.removeFirstFromQueue()
print("View queue")
print(queue)
print("View first index")
print(queue[1]!)
print("Try add nill value index 2")
queue[2] = nil
print("View queue")
print(queue)
print("Removing a specific item from the queue, value 15")
queue.removeValue(where: removeValue, removeValue: 15)
print("View queue")
print(queue)
print("Remove even value")
queue.removeElement(where: {$0 % 2 == 0})
print("View queue")
print(queue)
print("Remove value == 3")
queue.removeElement(where: {$0 == 3})
print("View queue")
print(queue)
