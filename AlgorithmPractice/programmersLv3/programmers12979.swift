// programmers Lv3 12979 기지국 설치
// two pointers 두 포인터

import Foundation

let n = 16
let stations: [Int] = [9]
let w = 2

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    
    var start = 1
    var end = 1
    
    for station in stations {
        end = station - w - 1 // 전파가 닿지 않을 거 같은 곳
        if start > end {
            start = station + w + 1
            continue
        }
        let num = end - start + 1
        let mod = num % (2 * w + 1)
        let dividen = num / (2 * w + 1)
        answer += mod == 0 ? dividen : dividen + 1
        
        start = station + w + 1 // 전파가 닿지 않을 거 같은 곳
    }
    
    let lastStation = stations.last!
    start = lastStation + w + 1
    end = n
    if start <= end {
        let num = end - start + 1
        let mod = num % (2 * w + 1)
        let dividen = num / (2 * w + 1)
        answer += mod == 0 ? dividen : dividen + 1
    }
    
    return answer
}

//let result = solution(n, stations, w)
//print(result)
