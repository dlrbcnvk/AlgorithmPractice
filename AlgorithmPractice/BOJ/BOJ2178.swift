// BOJ2178
import Foundation

var input = readLine()?.components(separatedBy: " ").map{ Int($0)! }
let n: Int = (input?[0])!
let m: Int = (input?[1])!

var board: [[Int]] = []
var ans = 0

for _ in 0..<n {
    var temp: [Int] = Array(readLine()!).map{ Int(String($0))! }
    board.append(temp)
}

var q: [((Int, Int), Int)] = []
q.append(((0, 0), 1))
ans += 1

while !q.isEmpty {
    let current = q.removeFirst()
    let a = current.0.0
    let b = current.0.1
    let cnt = current.1
    
    if a == n - 1 && b == m - 1 {
        print(cnt)
        exit(0)
    }
    
    if a > 0 {
        if board[a-1][b] == 1 {
            board[a-1][b] = 2
            q.append(((a-1, b), cnt + 1))
        }
    }
    if a < n - 1 {
        if board[a+1][b] == 1 {
            board[a+1][b] = 2
            q.append(((a+1, b), cnt + 1))
        }
    }
    if b > 0 {
        if board[a][b-1] == 1 {
            board[a][b-1] = 2
            q.append(((a, b-1), cnt + 1))
        }
    }
    if b < m - 1 {
        if board[a][b+1] == 1 {
            board[a][b+1] = 2
            q.append(((a, b+1), cnt + 1))
        }
    }
}

// ~~
