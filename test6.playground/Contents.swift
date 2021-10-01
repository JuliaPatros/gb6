import UIKit

//проверка на типы или приведение типов

struct Animal {
    let name: String
}

struct Wolf {
    let name: String
}

struct Dog {
    let name: String
    let wolf: Wolf
}

let animalOne = Animal(name: "Слон")
let animalTwo = Animal(name: "Воробей")
let animalThree = Animal(name: "Лев")

let wolfOne = Wolf(name: "Волк один")
let wolfTwo = Wolf(name: "Волк два")


let dog = Dog(name: "Ева", wolf: wolfOne)

var countAnimal = 0
var countWolf = 0
var countDog = 0

var array: [Any] = [animalOne, animalTwo, animalThree, wolfOne, wolfTwo, dog]

for index in array {
    if index is Dog {
        countDog = countDog + 1
    } else if index is Animal {
        countAnimal += 1
    } else if index is Wolf {
        countWolf += 1
    }
}

print(countDog)
print(countWolf)
print(countAnimal)

for index in array {
    if let dog = index as? Dog {
        print(dog.name)
    } else if let animal = index as? Animal {
        print(animal.name)
    } else if let wolf = index as? Wolf {
        print(wolf.name)
    }
}

//Дженерики

func getName() {

}

func getName(name: String) {

}

func getName(name: String, age: String) { //пергрузка методов

}

let arrayString = ["Маша", "Паша"]
let arrayInt = [1, 10]
let arrayDouble = [2.3, 7.1]

//плохая практика, не правильный подход

func printString(a: [String]) {
    for index in a {
        print(index)
    }
}

func printInt(a: [Int]) {
    for index in a {
        print(index)
    }
}

func printDouble(a: [Double]) {
    for index in a {
        print(index)
    }
}

printString(a: arrayString)
printInt(a: arrayInt)
printDouble(a: arrayDouble)

//Дженерики ---------

func genericAll<T>(a: [T]) {
    for index in a {
        print(index)
    }
}

genericAll(a: arrayString)
genericAll(a: arrayInt)
genericAll(a: arrayDouble)

// структура на дженериках

var emptyArrayS = [String]()
var emptyArrayI = [Int]()


struct GenericArray<T> {
    var items = [T]()

    mutating func push(item: T) {
        items.append(item)
    }
}

var arrays = GenericArray(items: emptyArrayS)
arrays.push(item: "Маша")
arrays.items

var arrayI = GenericArray(items: emptyArrayI)
arrayI.push(item: 10)
arrayI.items

// сравнение Дженериков

func isEqual<T: Equatable>(x: T, y: T) -> Bool {
    return x == y
}

isEqual(x: 10, y: 10)
isEqual(x: "dfd", y: "df")

// ---------------------------------------------------------------
//Subscript

let arrayDu = ["dsd","asd"]

arrayDu[0]
arrayDu[1]

struct Table {

    var multi: Int

    subscript(index: Int) -> Int {
        return multi * index
    }
}

var table = Table(multi: 10)
let b = table[3]
print(b)

struct Man {

    var man1 = "man1"
    var man2 = "man2"
    var man3 = "man3"

    subscript(index: Int) -> String? {
        switch index {
        case 0:
            return man1
        case 1:
            return man2
        case 2:
            return man3
        default:
            return nil
        }
    }
}

var say = Man()
say[1]

//Замыкания
//
//let driving = {
//    print("Hi")
//}
//driving ()
//
//let driving = {(place: String) in // замыкание принимает, но не возвр
//    print("Hi \(place)")
//}
//
//driving("Evgen")
//
//let driving = { (place: String) -> String in //замыкание, что-то прин, но не возвр
//    return "Hi \(place)"
//}
//
//let message = driving("Evgen")
//print(message)

//замыкание как параметр в методе
//let driving = {
//    print("Hi bro")
//}
//
//func travel(compilition: () -> Void) {
//    print("1")
//    compilition()
//    print("3")
//}
//
//travel(compilition: driving)
//travel {
//    print("123")
//}



//замыкание в качестве параметров, когда оно принимает параметр

//func travel(name: String, compilition: (String) -> Void) {
//    print("1")
//    compilition("London")
//    print("3")
//}
//
//travel(name: "123") { name in
//    print("city \(name)")
//}

//замыкание в качестве параметра, когда они что-то возвращают
//
//func travel(complition: (String) -> String ) {
//    print(1)
//
//    let description = complition("Moscow")
//    print(description)
//    print(3)
//}
//
//travel { (place: String) -> String in
//    return "i go \(place)"
//}
//
//travel { place in
//    return "i go \(place)"  //предпочтительная запись
//}
//
//travel { place in
//    return "i go \(place)"
//}
//
//travel {
//    "i go \($0)"            //ну или так
//}

//это все одинаковые записи, потому что Apple крутые)))



//&0

func travel(complition: (String, Int) -> Void ) {
    print("1")
    complition("Evgen", 60)
    print("2")
}

travel {name, age in
    print("Ваше имя \(name) и ваш возраст \(age)")
}

travel {
    print("Ваше имя \($0) и ваш возраст \($1)")
}

// функции высшего порядка

//map

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var a = numbers.map {$0 * 10 }
print(a)

//filter

let persons = ["alex", "jenny", "jason"]

let filter = persons.filter { $0.hasPrefix("j") }
print(filter)

//reduce

let item = [2, 3, 55, -100, 200]

let total = item.reduce(0, +)
print(total)

//compactMap flatMap

let numberSSS: [Int?] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, nil]
let sss = numberSSS.compactMap {
    $0
}
print(sss)

//forEach

for index in persons {
    print(index)
}

persons.forEach {
    print($0)
}
