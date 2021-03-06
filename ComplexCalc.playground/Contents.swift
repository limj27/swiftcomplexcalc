print("Welcome back to the UW Calculator")

// Your job is to fill out Calculator so all the expressions
// below both compile and return "true"
class Calculator {
    func add(lhs left: Int, rhs right: Int) -> Int {
        return left + right
    }
    func subtract(lhs left: Int, rhs right: Int) -> Int {
        return left - right
    }
    func multiply(lhs left: Int, rhs right: Int) -> Int {
        return left * right
    }
    func divide(lhs left: Int, rhs right: Int) -> Int {
        return left / right
    }
    func mathOp(lhs left: Int, rhs right: Int, op function: (Int, Int) -> Int) -> Int {
        return function(left, right)
    }
    func add(_ args : [Int]) -> Int{
        var total = 0
        for i in args {
            total += i
        }
        return total
    }
    func multiply(_ args : [Int]) -> Int{
        var total = 1
        for i in args {
            total *= i
        }
        return total
    }
    func count(_ args : [Int]) -> Int {
        return args.count
    }
    func avg(_ args : [Int]) -> Int {
        var total = 0
        for i in args {
            total += i
        }
        return total / args.count
    }
    func mathOp(args arr: [Int], beg x: Int, op function: (Int, Int) -> Int) -> Int{
        var total = x
        for i in arr {
            total = function(total, i)
        }
        return total
    }
    func add(lhs left: (Int, Int), rhs right: (Int, Int)) -> (Int, Int){
        let x = left.0 + right.0
        let y = left.1 + right.1
        return (x, y)
    }
    func subtract(lhs left: (Int, Int), rhs right: (Int, Int)) -> (Int, Int){
        let x = left.0 - right.0
        let y = left.1 - right.1
        return (x, y)
    }
    func add(lhs left: [String : Int], rhs right: [String : Int]) -> [String : Int]{
        let x = left["x"]! + right["x"]!
        let y = left["y"]! + right["y"]!
        return ["x" : x, "y" : y]
    }
    func subtract(lhs left: [String : Int], rhs right: [String : Int]) -> [String : Int]{
        let x = left["x"]! - right["x"]!
        let y = left["y"]! - right["y"]!
        return ["x" : x, "y" : y]
    }
}

let calc = Calculator()  // Don't change this declaration name; it's used in all the tests below

// ====> Add your own tests here if you wish <====

// ====> Do not modify code in this section <====
calc.add(lhs: 2, rhs: 2) == 4
calc.subtract(lhs: 2, rhs: 2) == 0
calc.multiply(lhs: 2, rhs: 2) == 4
calc.divide(lhs: 2, rhs: 2) == 1

calc.mathOp(lhs: 5, rhs: 5, op: { (lhs: Int, rhs: Int) -> Int in (lhs + rhs) + (lhs * rhs) }) == 35
    // This style is one way of writing an anonymous function
calc.mathOp(lhs: 10, rhs: -5, op: { ($0 + $1) + ($0 - $1) }) == 20
    // This is the second, more terse, style; either works

calc.add([1, 2, 3, 4, 5]) == 15
calc.multiply([1, 2, 3, 4, 5]) == 120
calc.count([1, 2, 3, 4, 5, 6, 7, 8]) == 8
calc.count([]) == 0
calc.avg([2, 2, 2, 2, 2, 2]) == 2
calc.avg([1, 2, 3, 4, 5]) == 3
calc.avg([1]) == 1

calc.mathOp(args: [1, 2, 3], beg: 0, op: { $0 + $1 }) == 6
    // this is (((0 op 1) op 2) op 3)
calc.mathOp(args: [1, 2, 3, 4, 5], beg: 0, op: { $0 + $1 }) == 15
    // this is (((((0 op 1) op 2) op 3) op 4) op 5)
calc.mathOp(args: [1, 1, 1, 1, 1], beg: 1, op: { $0 * $1 }) == 1
    // this is (((((1 op 1) op 1) op 1) op 1) op 1)

let p1 = (5, 5)
let p2 = (12, -27)
let p3 = (-4, 4)
let p4 = (0, 0)
calc.add(lhs: p1, rhs: p2) == (17, -22)
calc.subtract(lhs: p1, rhs: p2) == (-7, 32)
calc.add(lhs: p4, rhs: p4) == (0, 0)
calc.add(lhs: p3, rhs: p4) == (-4, 4)

let pd1 = ["x": 5, "y": 5]
let pd2 = ["x": -4, "y": 4]
calc.add(lhs: pd1, rhs: pd2) == ["x": 1, "y": 9]
calc.subtract(lhs: pd1, rhs: pd2) == ["x": 9, "y": 1]
