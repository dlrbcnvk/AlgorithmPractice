import Foundation

// programmers lv1 82612 부족한 금액 계산하기

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var ans : Int = 0
    
    var multiple: Int = {
        var sum = 0
        for i in 1...count {
            sum += i
        }
        return sum
    }()
    
    let totalPrice = price * multiple
    if totalPrice > money {
        return Int64(totalPrice - money)
    } else {
        return 0
    }
}

let result = solution(3, 20, 4)
print(result)
