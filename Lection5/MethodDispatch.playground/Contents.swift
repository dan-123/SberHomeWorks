//Реализация видов диспатчеризации

import UIKit
import PlaygroundSupport

// MARK: - Direct dispatch

struct FirstCalculator {
    let firstParam: Int
    let secondParam: Int
    
    func calcSum() -> Int {
        return firstParam + secondParam
    }
}

let firstCalculator = FirstCalculator(firstParam: 5, secondParam: 8)
firstCalculator.calcSum() // Direct dispatch

// MARK: - Witness table

protocol Calculate {
    func calcSum() -> Int
}

struct SecondCalculator: Calculate {
    let firstParam: Int
    let secondParam: Int
    
    func calcSum() -> Int {
        return firstParam + secondParam
    }
}

//при принудительном касте структуры к протоколу происходит вызов метода через Witness table
let secondCalculator: Calculate = SecondCalculator(firstParam: 5, secondParam: 8)
secondCalculator.calcSum() // Witness table

// MARK: - Virtual table

class ThirdCalculator {
    let firstParam: Int
    let secondParam: Int
    
    init(firstParam: Int, secondParam: Int) {
        self.firstParam = firstParam
        self.secondParam = secondParam
    }
    
    func calcSum() -> Int {
        return firstParam + secondParam
    }
}

let thirdCalculator = ThirdCalculator(firstParam: 5, secondParam: 8)
thirdCalculator.calcSum() // Virtual table

// MARK: - Message dispatch

class FourthCalculator {
    let firstParam: Int
    let secondParam: Int
    
    init(firstParam: Int, secondParam: Int) {
        self.firstParam = firstParam
        self.secondParam = secondParam
    }
    //для реализации метода  Message dispatch необходима динамическая функция
    @objc dynamic func calcSum() -> NSInteger {
        return NSInteger(integerLiteral: firstParam + secondParam)
    }
}

let fourthCalculator = FourthCalculator(firstParam: 5, secondParam: 8)
fourthCalculator.calcSum() // Message dispatch
