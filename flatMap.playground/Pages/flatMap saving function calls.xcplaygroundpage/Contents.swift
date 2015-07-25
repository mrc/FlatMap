//: [Previous](@previous)

//: Imagine are building a real estate app. You have a list of postcodes, and you want to do a single text search based on "human names" for those postcodes. But the input might contain bogus postcodes, which create no search terms.

let suburbNameByPostcode = [3000: "Melbourne", 3270: "Peterborough", 4855: "Jaffa", 4860: "The Coconuts", 6502: "Bindoon"]

let inputPostcodes = [3000, 4860, 90210]

//: There are a number of ways to do this: one "FP" way is to first filter out all the postcodes that are bogus, then map:

let searchTerms1 = inputPostcodes
    .filter {suburbNameByPostcode[$0] != nil}
    .map {suburbNameByPostcode[$0]!}


//: Using filter then map is a bit inefficient: it's 2 passes over the array, plus you need to do some work twice if it's used in both functions. With flatMap you can do it with one "fused" function (that does both the lookup, and the filter), and in just one pass over the array.

let searchTerms1 = inputPostcodes
    .flatMap {p -> [String] in
        if let suburb = suburbNameByPostcode[p] {
            return [suburb]
        }
        else {
            return []
        }
}

//: As a bonus, each suburb might resolve to multiple "friendly" names, and you want to search on them all. Here I'm using a function rather than a Dictionary<Int, Array<String>> because maybe you need a function to look up in the database or something.

func suburbNames(postcode: Int) -> Array<String> {
    if postcode == 3000 {
        return ["Melbourne", "Batmania"]
    }
    else if postcode == 4860 {
        return ["Coconuts"]
    }
    else {
        return []
    }
}

let searchTerms3 = inputPostcodes.flatMap(suburbNames)

//: [Next](@next)
