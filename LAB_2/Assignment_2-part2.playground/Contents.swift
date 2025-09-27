import Cocoa

//Problem 6
func fibbonacci(_ n: Int) -> [Int]{
    if n <= 0 {return[]}
    else if n == 1 {return [0]} // here is special case where value is 0 or 1
    else if n == 2 {return [0, 1]}
    
    var sequence = [0, 1] // we already include 0 and 1
    
    while sequence.count < n {
        // Here goes the calculation
        let first = sequence[sequence.count - 1]
        let second = sequence[sequence.count - 2]
        let next = first + second
        sequence.append(next)
    }
    
    return sequence
}

print(fibbonacci(0))
print(fibbonacci(1))
print(fibbonacci(2))
print(fibbonacci(5))
print(fibbonacci(10))


print()
print()
print()
//Problem 7
var scores: [String:Int] = [
    "Arman" : 85,
    "Bayrzhan" : 70,
    "Sanzhar": 95,
    "Damir": 60,
    "Aidana": 100
]

var total = 0
// Calculation odf total score
for(_, score) in scores {
    total += score
}
// Calculation of avr, high and low
let average = Double(total) / Double(scores.count)

let highest = scores.values.max() ?? 0
let lowest = scores.values.min() ?? 0

print("Average score: \(average)")
print("Highest score: \(highest)")
print("Lowest score: \(lowest)")
print()

for (name,score) in scores{
    //Comparison of results to check whether it above or below
    if Double(score) >= average {
        print("\(name): \(score) above average")
    }
    else {
        print("\(name): \(score) below average")
    }
}


print()
print()
print()
//Problem 8
func isPalindrome(_ text: String) -> Bool {
    let cleaned = text.lowercased().filter{$0.isLetter || $0.isNumber} // only saving letter and numbers
    let forward = String(cleaned)
    let backward = String(cleaned.reversed())
    return forward == backward // checking whether word id palindrome
}

print(isPalindrome("Racecar"))
print(isPalindrome("A man a plan a canal Panama"))
print(isPalindrome("Hello"))


print()
print()
print()
//Problem 9
// Calcultaions
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}
func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}
func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}
func divide(_ a: Double, _ b: Double) -> String {
    if b == 0 {
        return "Error: Division by zero" // do not divides to 0
    } else {
        return "\(a / b)"
    }
}

var continueCalc = true

while continueCalc {
    // pretend user input
   let num1: Double = 10
   let num2: Double = 0
   let operation = "/"
    
    var result: String = ""
    
    switch operation { // Calls function depending on user input
    case "+":
        result = "\(add(num1, num2))"
    case "-":
        result = "\(subtract(num1, num2))"
    case "*":
        result = "\(multiply(num1, num2))"
    case "/":
        result = divide(num1, num2)
    case "!":
        continueCalc = false
    default:
        result = "Invalid operation"
    }
        
    print("Result: \(result)")
    
    continueCalc = false
}



print()
print()
print()
//Problem 10
func hasUniqueCharacters(_ text: String) -> Bool {
    var seen: [Character] = []
    
    for char in text {
        if seen.contains(char) {
            return false  // found a duplicate
        }
        seen.append(char)  // add character to seen list
    }
    
    return true
}

print(hasUniqueCharacters("Swift"))
print(hasUniqueCharacters("Hello"))
print(hasUniqueCharacters("ABCDE"))
print(hasUniqueCharacters("Aa"))
