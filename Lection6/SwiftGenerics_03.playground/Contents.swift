import UIKit

// MARK: - Задача 3*. К выполнению необязательна.

enum LinkedList<T> {
    indirect case value(element: T, nextElement: LinkedList<T>)
    case end
}

let linkedList = LinkedList.value(element: 1, nextElement: .value(element: 2, nextElement: .value(element: 3, nextElement: .end)))

print(linkedList)
