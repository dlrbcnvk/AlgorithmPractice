import Foundation

// programmers lv2 12980 점프와 순간이동
func solution(_ n:Int) -> Int {
    
    var value: Int = n
    var cnt = 0
    while value > 0 {
        if value % 2 == 1 {
            cnt += 1
            value -= 1
        } else {
            value /= 2
        }
    }
    return cnt
}

let result = solution(987654321)
print(result)
