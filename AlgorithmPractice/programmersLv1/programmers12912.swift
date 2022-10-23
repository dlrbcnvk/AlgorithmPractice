import Foundation
// programmers lv1 12912 두 정수 사이의 합

func solution(_ a:Int, _ b:Int) -> Int64 {
    var sum = 0
    if a <= b {
        for num in a...b {
            sum += num
        }
    } else {
        for num in b...a {
            sum += num
        }
    }
    return Int64(sum)
}


let result = solution(3, 5)
print(result)
