//: [Previous](@previous)

//: You can use flatmap as a kind of filter: your function can return an empty array when given a value it wants to "skip". Then, after mapping, the empty arrays "collapse" (when the array-of-arrays is joined).

func isEven(n: Int) -> Bool {
    return n % 2 == 0
}

let numbers = Array<Int>(1...5)

let evens = numbers.flatMap {isEven($0) ? [$0] : []}
evens

//: This example is trivial - you could also have just used filter...

numbers.filter(isEven)

//: ...so this is a bit academic, but it shows that you can use flatMap to replace both map (e.g. just make your function return an array for each case), and filter (make your function return an empty array for some cases.)

//: [Next](@next)
