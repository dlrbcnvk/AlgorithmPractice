// programmers Lv3 12987 숫자 게임
// 아직 못 품

import Foundation

let a = [5,1,3,7]
let b = [2,2,6,8]

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var score = 0
    
    let teamA = a
    var teamB = b.sorted()
    
    func findFirstGreaterThan(_ target: Int) -> Int {
        var start = 0
        var end = teamB.count - 1
        while start < end {
            var mid = (start + end) / 2
            if teamB[mid] > target {
                end = mid
            } else {
                start = mid + 1
            }
        }
        return start
    }
    
    for cardA in teamA {
        let index = findFirstGreaterThan(cardA)
        if index >= teamA.count {
            continue
        }
        
        if cardA < teamB[index] {
            score += 1
            teamB.remove(at: index)
        }
    }
    
    return score
}

let result = solution(a, b)
print(result)

//
//let teamB = [2,2,6,8,3,8,4,3,56,5,5,7,7,7,9,1,3,2].sorted()
//
//func findFirstGreaterThan(_ target: Int) -> Int {
//    var start = 0
//    var end = teamB.count
//    while start < end {
//        let mid = (start + end) / 2
//        if teamB[mid] > target {
//            end = mid
//        } else {
//            start = mid + 1
//        }
//    }
//    return start
//}
//
//let temp = findFirstGreaterThan(7)
//print(teamB)
//print(temp)

