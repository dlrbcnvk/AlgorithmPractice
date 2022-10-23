import Foundation

// programmers lv1 42748 K번째수

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var ans: [Int] = []
    
    for command in commands {
        let first = command[0] - 1
        let last = command[1] - 1
        let k = command[2]
        
        var arr: [Int] = []
        for idx in first...last {
            arr.append(array[idx])
        }
        arr.sort()
        ans.append(arr[k-1])
    }

    return ans
}

let result = solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])
print(result)
