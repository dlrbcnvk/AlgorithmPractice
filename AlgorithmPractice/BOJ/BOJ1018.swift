// BOJ1018

import Foundation

let Wbar = ["W", "B", "W", "B", "W", "B", "W", "B"]
let Bbar = ["B", "W", "B", "W", "B", "W", "B", "W"]
var miniboard: [[String]] = []
for _ in 0..<4 {
    miniboard.append(Wbar)
    miniboard.append(Bbar)
}


var board: [[String]] = []

var input = readLine()?.components(separatedBy: " ").map { Int(String($0))! }
guard let nm = input else { exit(0) }
let n = nm[0]
let m = nm[1]

for _ in 0..<n {
    let temp = Array(readLine()!).map{ String($0) }
    board.append(temp)
}

var mincnt = 64

for x in 0...n-8 {
    for y in 0...m-8 {
        let temp = search(x, y)
        mincnt = temp < mincnt ? temp : mincnt
    }
}

print(mincnt)


func search(_ x: Int, _ y: Int) -> Int {
    var cnt = 0
    
    for i in 0...7 {
        for j in 0...7 {
            if miniboard[i][j] != board[x+i][y+j]{
                cnt += 1
            }
        }
    }
    
    if cnt > 32 {
        cnt = 64 - cnt
    }
    return cnt > 32 ? 64 - cnt : cnt
}

// ~~
