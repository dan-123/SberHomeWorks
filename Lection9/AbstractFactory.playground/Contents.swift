// MARK: - Abstract factory

/*
 Изготовление левой и правой палочки твикс на разных заводах.
 */

protocol CandyBar {
    var name: String {get}
    func makingCandyBar()
}

class LeftCandyBar: CandyBar {
    var name: String = "левая палочка"
    
    func makingCandyBar() {
        print("Изготовлена \(name)")
    }
}

class RightCandyBar: CandyBar {
    var name: String = "правая палочка"
    
    func makingCandyBar() {
        print("Изготовлена \(name)")
    }
}

protocol AbstractFactory {
    func createCandyBar() -> CandyBar
}

class FactoryForLeftCandyBar: AbstractFactory {
    func createCandyBar() -> CandyBar {
        print("Создание левой палочки")
        return LeftCandyBar()
    }
}

class FactoryForRightCandyBar: AbstractFactory {
    func createCandyBar() -> CandyBar {
        print("Создание правой палочки")
        return RightCandyBar()
    }
}

// MARK: - Test

let factoryForLeftCandyBar = FactoryForLeftCandyBar()
let leftCandyBar = factoryForLeftCandyBar.createCandyBar()
leftCandyBar.makingCandyBar()

let factoryForRightCandyBar = FactoryForRightCandyBar()
let rightCandyBar = factoryForRightCandyBar.createCandyBar()
rightCandyBar.makingCandyBar()
