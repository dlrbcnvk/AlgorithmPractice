
import Foundation
// programmers lv1 12901 2016년


func solution(_ a:Int, _ b:Int) -> String {
    let dayarr: [Int] = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var daysum = 0
    if a > 1 {
        for idx in 1...a-1 {
            daysum += dayarr[idx]
        }
        daysum += b
        
    } else {
        daysum = b
    }
    
    var weekdaynum = (daysum % 7) + 4
    weekdaynum = weekdaynum >= 7 ? weekdaynum - 7 : weekdaynum
    var weekday: String = ""
    switch weekdaynum {
    case 0:
        weekday = "SUN"
        break
    case 1:
        weekday = "MON"
        break
    case 2:
        weekday = "TUE"
        break
    case 3:
        weekday = "WED"
        break
    case 4:
        weekday = "THU"
        break
    case 5:
        weekday = "FRI"
        break
    case 6:
        weekday = "SAT"
        break
    default:
        break
    }
    return weekday
}

let result = solution(10, 9)
print(result)
