import Foundation

// programmers lv1 87389 나머지가 1이 되는 수 찾기

func solution(_ n:Int) -> Int {
    for i in 2...n {
        if n % i == 1{
            return i
        }
    }
    return 0
}

let result = solution(10)
print(result)
