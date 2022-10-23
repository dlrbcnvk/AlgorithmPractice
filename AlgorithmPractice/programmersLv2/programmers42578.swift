import Foundation

// programmers lv2 42578 위장
// 스파이들은 매일 다른 옷을 조합하여 입어 자신을 위장합니다.


func solution(_ clothes:[[String]]) -> Int {
    var typesdic: [String: Int] = [:]
    var types: [String] = []
    for cloth in clothes {
        let type = cloth[1]
        if !types.contains(type) {
            types.append(type)
            typesdic[type] = 1
        } else {
            typesdic[type]! += 1
        }
    }
    
    var totalCase: Int = 1
    for dic in typesdic {
        totalCase *= dic.value + 1
    }
    return totalCase - 1
}


let result = solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]])
print(result)
