// programmers lv2 42587 프린터
import Foundation


func solution(_ priorities: [Int], _ location: Int) -> Int {
    
    var cnt = 0
    var arr = priorities
    var loc = location
    
    var max = arr.max()!
    
    while true {
        if arr.first! == max {
            arr.removeFirst()
            cnt += 1
            if loc == 0 {
                break
            }
            max = arr.max()!
            loc = (loc == 0) ? arr.count - 1 : loc - 1
        } else {
            let temp = arr.first!
            arr.removeFirst()
            arr.append(temp)
            loc = (loc == 0) ? arr.count - 1 : loc - 1
        }
    }
    return cnt
}

let result = solution([1,1,1,1,2,3,4], 3)
print(result) // 7
