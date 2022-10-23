// programmers Lv2 49994 방문 길이

import Foundation

let dirs = "LLRR"



func solution(_ dirs:String) -> Int {
    
    func isSameWay(way1: ((Int, Int), (Int, Int)), way2: ((Int, Int), (Int, Int))) -> Bool {
        let way1StartX = way1.0.0
        let way1StartY = way1.0.1
        let way1EndX = way1.1.0
        let way1EndY = way1.1.1
        
        let way2StartX = way2.0.0
        let way2StartY = way2.0.1
        let way2EndX = way2.1.0
        let way2EndY = way2.1.1
        
        if way1StartX == way2StartX && way1StartY == way2StartY && way1EndX == way2EndX && way1EndY == way2EndY {
            return true
        } else if way1StartX == way2EndX && way1StartY == way2EndY && way1EndX == way2StartX && way2EndY == way2StartY {
            return true
        } else {
            return false
        }
    }
    
    func checkIsDuplicatedAndUpdatePoint(duplicateWalkingCount: inout Int, walks: inout [((Int, Int), (Int, Int))], isDuplicated: inout Bool, currentPoint: (Int, Int), newPoint: (Int, Int)) -> (Int, Int) {
        for walk in walks {
            let way = (currentPoint, newPoint)
            isDuplicated = isSameWay(way1: way, way2: walk)
            if isDuplicated {
                duplicateWalkingCount += 1
                break
            }
        }
        if !isDuplicated {
            walks.append((currentPoint, newPoint))
            walks.append((newPoint, currentPoint))
        }
        
        return newPoint
    }
    
    var currentPoint = (5, 5)
    let directions = dirs.map { dir in
        String(dir)
    }
    var totalWalking = directions.count
    var walks: [((Int, Int), (Int, Int))] = []
    var duplicateWalkingCount = 0
    var isDuplicated: Bool = false
    
    for direction in directions {
        let currentX = currentPoint.0
        let currentY = currentPoint.1
        isDuplicated = false
        
        switch direction {
        case "L":
            if currentY == 0 {
                totalWalking -= 1
                break
            } else {
                let newPoint = (currentX, currentY - 1)
                currentPoint = checkIsDuplicatedAndUpdatePoint(duplicateWalkingCount: &duplicateWalkingCount, walks: &walks, isDuplicated: &isDuplicated, currentPoint: currentPoint, newPoint: newPoint)
                break
            }
        case "R":
            if currentY == 10 {
                totalWalking -= 1
                break
            } else {
                let newPoint = (currentX, currentY + 1)
                currentPoint = checkIsDuplicatedAndUpdatePoint(duplicateWalkingCount: &duplicateWalkingCount, walks: &walks, isDuplicated: &isDuplicated, currentPoint: currentPoint, newPoint: newPoint)
                break
            }
        case "U":
            if currentX == 0 {
                totalWalking -= 1
                break
            } else {
                let newPoint = (currentX - 1, currentY)
                currentPoint = checkIsDuplicatedAndUpdatePoint(duplicateWalkingCount: &duplicateWalkingCount, walks: &walks, isDuplicated: &isDuplicated, currentPoint: currentPoint, newPoint: newPoint)
                break
            }
        case "D":
            if currentX == 10 {
                totalWalking -= 1
                break
            } else {
                let newPoint = (currentX + 1, currentY)
                currentPoint = checkIsDuplicatedAndUpdatePoint(duplicateWalkingCount: &duplicateWalkingCount, walks: &walks, isDuplicated: &isDuplicated, currentPoint: currentPoint, newPoint: newPoint)
                break
            }
        default:
            break
        }
    }
    return totalWalking - duplicateWalkingCount
}


//let result = solution(dirs)
//print(result)

