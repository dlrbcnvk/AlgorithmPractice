import Foundation

// programmers lv1 12982 예산

func solution(_ d:[Int], _ budget:Int) -> Int {
    
    var arr = d.sorted()
    var sum = 0
    var cnt = 0
    for num in arr {
        if sum + num > budget {
            break
        }
        sum += num
        cnt += 1
    }
    
    return cnt
}

let result = solution([1,3,2,5,4], 9)
print(result)
