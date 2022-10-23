import Foundation

// programmers lv1 68935 3진법 뒤집기

func solution(_ n:Int) -> Int {
    
    var arr: [String] = []
    var number = n
    while number != 0 {
        let mod = number % 3
        arr.append("\(mod)")
        number -= mod
        number /= 3
    }
    var arrInt = arr.map { str in
        return Int(str)!
    }
    
    arrInt.reverse()
    
    var result = 0
    var multiplier = 1
    
    for int in arrInt {
        result += int * multiplier
        multiplier *= 3
    }
    return result
}

let result = solution(45)
print(result)
