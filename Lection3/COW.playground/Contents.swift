//Реализовать COW на своей структуре со свойством reference type  (isKnownUniquelyReferenced)

final class Cat {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Pet {
    var catName: Cat
    var age: Int
    
    init(catName: String, age: Int) {
        self.catName = Cat(name: catName)
        self.age = age
    }
    
    var value: String {
        get { return catName.name}
        set {
            if (!isKnownUniquelyReferenced(&catName)) {
                catName = Cat(name: newValue)
                return
            }
        }
    }
}


var firstPet = Pet(catName: "firstCat", age: 3)
var secondPet = firstPet

print(firstPet.value)
print(secondPet.value)

secondPet.value = "secondCat"

print(firstPet.value)
print(secondPet.value)
