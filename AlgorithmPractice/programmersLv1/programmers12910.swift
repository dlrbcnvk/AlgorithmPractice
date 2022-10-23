
import Foundation
// programmers lv1 12910 나누어 떨어지는 숫자 배열

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var ans: [Int] = []
    
    for num in arr {
        if num % divisor == 0 {
            ans.append(num)
        }
    }
    if ans.isEmpty {
        return [-1]
    }
    return ans.sorted()
}

let result = solution([5,9,7,10], 5)
print(result)
