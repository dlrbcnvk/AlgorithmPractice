// programmers Lv2 12945 피보나치 수

import Foundation

func solution(_ n:Int) -> Int {
    if n == 2 {
        return 1
    }
    
    var arr = [0, 1, 1]
    for index in 3...n {
        let value = (arr[index - 2] + arr[index - 1]) % 1234567
        arr.append(value)
    }
    return arr.last!
}
