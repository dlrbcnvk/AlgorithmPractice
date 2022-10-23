// programmers lv2 77485 행렬 테두리 회전하기
import Foundation


func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    func rotate(_ query: [Int]) -> Int {
        let x1 = query[0]
        let y1 = query[1]
        let x2 = query[2]
        let y2 = query[3]
        let start = board[x1][y1]
        
        var min = start
        
        var temp: Int
        var idx = x1 + 1
        while idx <= x2 {
            temp = board[idx][y1]
            board[idx-1][y1] = temp
            min = temp < min ? temp : min
            idx += 1
        }
        
        idx = y1 + 1
        while idx <= y2 {
            temp = board[x2][idx]
            board[x2][idx-1] = temp
            min = temp < min ? temp : min
            idx += 1
        }
        
        idx = x2 - 1
        while idx >= x1 {
            temp = board[idx][y2]
            board[idx+1][y2] = temp
            min = temp < min ? temp : min
            idx -= 1
        }
        
        idx = y2 - 1
        while idx > y1 {
            temp = board[x1][idx]
            board[x1][idx+1] = temp
            min = temp < min ? temp : min
            idx -= 1
        }
        board[x1][y1+1] = start
        
        return min
    }
    
    var board: [[Int]] = []
    var ans: [Int] = []
    for _ in 0...rows {
        board.append(Array(repeating: 0, count: columns+1))
    }
    var num = 1
    for i in 1...rows {
        for j in 1...columns {
            board[i][j] = num
            num += 1
        }
    }
    
    for query in queries {
        let rotateResult = rotate(query)
        ans.append(rotateResult)
    }
    
    return ans
}


var result = solution(100, 97, [[1,1,100,97]])
print(result)
