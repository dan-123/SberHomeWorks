import UIKit

// MARK: - Задача 1 "Сделать так, чтобы закомментированный код работал"

func sumTwoValues<T : AdditiveArithmetic>(_ a: T, _ b: T) -> T {
    let result = a + b
    return result
}

extension String: AdditiveArithmetic {

    public static var zero: String {
        return ""
    }

    public static func - (a: String, b: String) -> String {
        return ""
    }
}

let a = 25.0
let b = 34.0

let resultDouble = sumTwoValues(a, b)
print(resultDouble)

let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c, d)
print(resultString)

