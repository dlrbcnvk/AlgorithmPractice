import Foundation
// programmers lv2 81302 거리두기 확인하기
// 5x5 room에 사람이 있을 때 거리두기가 잘 지켜지는지 판단
// 기준 좌표에 사람이 있을 때 "맨해튼 거리" |x1-x2| + |y1-y2| = 1 or 2 가 되는 곳에 사람이 없어야 함
// 사람과 사람 사이 벽이 있는 경우 맨해튼 거리 내에 있어도 거리두기 지키는 걸로 판단

func solution(_ places:[[String]]) -> [Int] {
    
    let dx = [-2, -1, -1, -1, 0, 0, 0, 0, 1, 1, 1, 2]
    let dy = [0, -1, 0, 1, -2, -1, 1, 2, -1, 0, 1, 0]
    
    var ans: [Int] = []
    
    for place in places {
        var room: [[Character]] = []
        for line in place {
            room.append(Array(line))
        }
        var isDistancing = true
        
        for i in 0...4 {
            if !isDistancing {
                break
            }
            for j in 0...4 {
                if !isDistancing {
                    break
                }
                if room[i][j] != "P" {
                    continue
                }
                
                for idx in 0...11 {
                    let x = i + dx[idx]
                    let y = j + dy[idx]
                    if !(0...4).contains(x) || !(0...4).contains(y) {
                        continue
                    }
                    
                    if [2,5,6,9].contains(idx) {
                        if room[x][y] == "P" { // 기준 사람과의 거리=1, 거리두기 위배
                            isDistancing = false
                        }
                    } else {
                        if idx == 0 {
                            if room[x][y] == "P" && room[x+1][y] != "X"{
                                isDistancing = false
                            }
                        } else if idx == 4 {
                            if room[x][y] == "P" && room[x][y+1] != "X"{
                                isDistancing = false
                            }
                        } else if idx == 7 {
                            if room[x][y] == "P" && room[x][y-1] != "X"{
                                isDistancing = false
                            }
                        } else if idx == 11 {
                            if room[x][y] == "P" && room[x-1][y] != "X"{
                                isDistancing = false
                            }
                        } else if idx == 1 {
                            if room[x][y] == "P" && (room[x+1][y] != "X" || room[x][y+1] != "X") {
                                isDistancing = false
                            }
                        } else if idx == 3 {
                            if room[x][y] == "P" && (room[x+1][y] != "X" || room[x][y-1] != "X") {
                                isDistancing = false
                            }
                        } else if idx == 8 {
                            if room[x][y] == "P" && (room[x-1][y] != "X" || room[x][y+1] != "X") {
                                isDistancing = false
                            }
                        } else if idx == 10 {
                            if room[x][y] == "P" && (room[x-1][y] != "X" || room[x][y-1] != "X") {
                                isDistancing = false
                            }
                        }
                    }
                    
                }
                
            }
        }
        
        if isDistancing {
            ans.append(1)
        } else {
            ans.append(0)
        }
        
    }
    
    return ans
}

var temp = [["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]

var result = solution(temp)
print(result)
