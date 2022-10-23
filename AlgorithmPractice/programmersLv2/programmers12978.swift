// programmers Lv2 12978 배달
// 다익스트라 (단일출발점 최단경로문제)

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 1
    
    var row: [Int] = []
    for _ in 0...N {
        row.append(Int.max / 2)
    }
    var board: [[Int]] = []
    for _ in 0...N {
        board.append(row)
    }
    for line in road {
        if board[line[0]][line[1]] > line[2] {
            board[line[0]][line[1]] = line[2]
            board[line[1]][line[0]] = line[2]
        }
    }
    var touch: [Int] = Array(1...N+1)
    var length: [Int] = row
    for i in 2...N {
        touch[i] = 1
        length[i] = board[1][i]
    }
    
    var vnear: Int = 0
    for _ in 2...N {
        var min = Int.max
        for i in 2...N {
            if length[i] >= 0 && length[i] < min {
                min = length[i]
                vnear = i
            }
        }
        
        for i in 2...N {
            if length[vnear] + board[vnear][i] < length[i] {
                length[i] = length[vnear] + board[vnear][i]
                touch[i] = vnear
            }
        }
        if length[vnear] <= k {
            answer += 1
        }
        length[vnear] = -1
    }

    return answer
}

//let N: Int = 6
//let road: [[Int]] = [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]]
//let k: Int = 4

//let result = solution(N, road, k)
//print(result)
