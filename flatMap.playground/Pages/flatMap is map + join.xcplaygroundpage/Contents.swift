//: # Using flatMap with arrays

//: You have an array of ints,

let numbers = Array<Int>(1...5)

//: and a function that takes an int and returns an array of ints.

func powers(n: Int) -> Array<Int> {
    return [n, n*n, n*n*n]
}

//: Array.map transforms each int into an array, so you get an array-of-arrays:

numbers.map(powers)

//: Array.flatMap does the same, but then flattens the array-of-arrays, so you just get a single dimensional array:

numbers.flatMap(powers)

//: It's just like map then join:

[].join(numbers.map(powers))

//: It ought to be able to do it more efficiently though. For example, it doesn't need to create the intermediate array-of-arrays.

//: [Next](@next)
