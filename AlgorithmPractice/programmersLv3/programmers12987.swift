// programmers Lv3 12987 숫자 게임
// 아직 못 품

import Foundation

let a = [2,2,2,2]
let b = [1,1,1,1]

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var score = 0
    
    var teamA = a.sorted()
    teamA.reverse()
    var teamB = b.sorted()
    // 이분 탐색을 해야 하나??
    
    for idx in 0..<teamA.count {
        if teamA[idx] < teamB[idx] {
            score += 1
        }
    }
    
    return score
}

//let result = solution(a, b)
//print(result)
