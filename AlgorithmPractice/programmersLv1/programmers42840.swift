import Foundation

// programmers lv1 42840 모의고사

func solution(_ answers:[Int]) -> [Int] {
    
    let firstPlayer = [1,2,3,4,5]
    let secondPlayer = [2,1,2,3,2,4,2,5]
    let thirdPlayer = [3,3,1,1,2,2,4,4,5,5]
    
    var firstCorrect = 0
    var secondCorrect = 0
    var thirdCorrect = 0
    
    var firstIdx = 0
    var secondIdx = 0
    var thirdIdx = 0
    
    for answer in answers {
        if firstPlayer[firstIdx] == answer {
            firstCorrect += 1
        }
        if secondPlayer[secondIdx] == answer {
            secondCorrect += 1
        }
        if thirdPlayer[thirdIdx] == answer {
            thirdCorrect += 1
        }
        
        firstIdx = firstIdx + 1 == firstPlayer.count ? 0 : firstIdx + 1
        secondIdx = secondIdx + 1 == secondPlayer.count ? 0 : secondIdx + 1
        thirdIdx = thirdIdx + 1 == thirdPlayer.count ? 0 : thirdIdx + 1
    }
    
    var ans: [Int] = []
    let maximum = [firstCorrect, secondCorrect, thirdCorrect].max()
    if firstCorrect == maximum {
        ans.append(1)
    }
    if secondCorrect == maximum {
        ans.append(2)
    }
    if thirdCorrect == maximum {
        ans.append(3)
    }

    return ans
}

let result = solution([1,3,2,4,2])
print(result)
