//Step 1
let firstName: String = "Madiyar"
let lastName: String = "Bekmurat"
let birthYear: Int = 2004
var isStudent: Bool = true
let height: Double = 1.90
//Additional
let bornCity = "Kyzylorda"
var laptop = "MacBook pro 2021💻"
var usualMood = "😐"
var currentYear: Int = 2025
var age = currentYear - birthYear

//Step 2
let hobby = "going to gym"
let numberOfHobbies: Int = 4
let favouriteNumber: Int = 9
let isHobbyCreative = false
//Additional
var PRofbenchPressing: Int = 90
let hatingExercise = "leg squats"

//Bonus task
let futureGoals = "In the future I wanna start working in IT industry, and might work actively on my start up project."

//Step 3
let lifeStory = """
My name is \(firstName). I am \(age) years old, born in \(birthYear). The fact that I am a student is \(isStudent), addiationally, my height is \(height) m. \(bornCity) is where I born. Laptop I am using is \(laptop), and my usual mood is something like this \"\(usualMood)\".

My hobby is \(hobby), in total I have \(numberOfHobbies) hobbies. Not important, but I like number \(favouriteNumber). There is not so much reason for it. My personal record in bench press is \(PRofbenchPressing) kg. I hate \(hatingExercise), this exercise is too exhausting😵 if you are using serious weight.

\(futureGoals)
"""

//Step 4
print(lifeStory)
