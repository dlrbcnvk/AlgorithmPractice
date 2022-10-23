import Foundation

// programmers lv1 77884 약수의 개수와 덧셈

func solution(_ left:Int, _ right:Int) -> Int {
    
    func getDivisorCount(_ num: Int) -> Int {
        var cnt = 0
        for i in 1...num {
            if num % i == 0 {
                cnt += 1
            }
        }
        return cnt
    }
    
    var result = 0
    for i in left...right {
        let divisorCount = getDivisorCount(i)
        if divisorCount % 2 == 0 {
            result += i
        } else {
            result -= i
        }
    }

    return result
}

let result = solution(13, 17)
print(result)
