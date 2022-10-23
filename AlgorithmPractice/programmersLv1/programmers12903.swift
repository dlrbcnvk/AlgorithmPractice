import Foundation

// programmers lv1 12903 가운데 글자 가져오기

func solution(_ s:String) -> String {
    let arr = s.map { char in
        String(char)
    }
    let arrSize = arr.count
    var ans: String = ""
    
    if arrSize % 2 == 1 {
        ans += arr[Int(arrSize / 2)]
    } else {
        ans += arr[Int(arrSize / 2) - 1] + arr[Int(arrSize / 2)]
    }
    return ans
}

let result = solution("qwer")
print(result)
