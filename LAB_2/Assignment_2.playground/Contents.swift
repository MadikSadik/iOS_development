import Cocoa

// Problem 1
for number in 1...100{
    // Multiples 3 and 5
    if number % 3 == 0 && number % 5 == 0{
        print("FizzBuzz value \(number)")
    }
    // the rest is seperate
    else if number % 3 == 0 {
        print("Fizz \(number)")
    }
    else if number % 5 == 0 {
        print("Buzz \(number)")
    }
    
}

//Problem 2
print()
print()
print()
func isPrime(_ number: Int) -> Bool{
    if number < 2 { return false }
    if number == 2 { return true }
    
    let limit = Int(sqrt(Double(number)))
    // Lowers number on half
    if limit < 2 {return true}
    for check in 2...limit {
        if number % check == 0 {
            return false
            // In this loop checks if it is not prime
        }
    }
    return true
}

for value in 1...100 { // Starts loop and calls function
    if isPrime(value){
        print(value)
    }
}


print()
print()
print()
//Problem 3
let tempNumber: Double = 25
let unit = "C"

func C_faranANDkelvin(_ celsius: Double) -> (fahrenheit: Double, kelvin: Double) {
    let fahrenheit = (1.8 * celsius) + 32
    let kelvin = celsius + 273.15
    return (fahrenheit, kelvin)
    // Finds F and K
}

func F_celsiusANDkelvin(_ fahrenheit: Double) -> (celsius: Double, kelvin: Double){
    let celsius = (0.56 * (fahrenheit - 32))
    let kelvin = celsius + 273.15
    return (celsius, kelvin)
    //Finds C and K
}

func K_celsiusANDfahrenheit(_ kelvin: Double) -> (celsius: Double, fahrenheit: Double){
    let celsius = kelvin - 273.15
    let fahrenheit = (1.8 * celsius)+32
    return (celsius, fahrenheit)
    //Finds C and F
}


switch unit { // Checks what unit user wrote
case "F":
    let result = F_celsiusANDkelvin(tempNumber)
    print("\(tempNumber)°F = \(result.celsius)°C, \(result.kelvin)K")
case "C":
    let result = C_faranANDkelvin(tempNumber)
    print("\(tempNumber)°C = \(result.fahrenheit)°F, \(result.kelvin)K")
case "K":
    let result = K_celsiusANDfahrenheit(tempNumber)
    print("\(tempNumber)K = \(result.celsius)°C, \(result.fahrenheit)°F")
default:
    print("Write normal unit")
}


print()
print()
print()
// Problem 4
var array: [String] = ["Chicken", "Fish", "Cereal"]

var command: String = ""
while true {
    // Explains user what he can do
    print ("To add an item press key 1")
    print ("To remove an item press key 2")
    print ("To view current shopping list press key 3")
    print ("To exit press key 4")
    command = "1"
    
    // Actions that person can perform
    if command == "1" {
        print("Write the item you want to add")
        var item = "Apple"
        array.append(item)
    }
    else if command == "2" {
        print("Write the item you want to remove")
        var item = "Chicken"
        // Checks is item in array
        if array.contains(item){
            if let index = array.firstIndex(of: item) {
                array.remove(at: index)
            }
        }
        else{print("\(item) does not exists")}
    }
    else if command == "3"{
        print("The list of items you choose")
        for sum in array{
            print(sum)
        }
    }
    // Here the loop breaks
    else if command == "4"{
        print("Exiting...")
        break
    }

}


print()
print()
print()
//Problem 5
let sentence = "Hello hello, world! Hello Swift world"

// Lowercase everything
let lowerSentence = sentence.lowercased()

// Only keep letters and spaces
var cleanSentence = ""
for char in lowerSentence {
    if char.isLetter || char == " " {
        cleanSentence.append(char)
    }
}

// Splits the words
let words = cleanSentence.split(separator: " ")

// Dictionary to count
var wordCount: [String: Int] = [:]

for word in words {
    let wordStr = String(word)
    if wordCount[wordStr] == nil {
        // if the word is not yet in the dictionary, start counting from 1
        wordCount[wordStr] = 1
    } else {
        // if the word already exists, add 1 to the old count
        wordCount[wordStr]! += 1
    }
}

// Display results
for (word, count) in wordCount {
    print("\(word): \(count)")
}
