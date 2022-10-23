//
//  BinarySearch.swift
//  swift_algorithm
//
//  Created by 조성규 on 2022/10/20.
//

import Foundation

// BinarySearch
var array = [2,4,6,8,8,8,8,10,12,14,16,18,20]

func binarySearch(arr: inout [Int], target: Int, start: Int, end: Int) -> Bool {
    let n: Int = arr.count
    if start > n - 1 || end < 0 {
        return false
    }
    if start > end {
        return false
    }
    
    let mid: Int = Int((start + end) / 2)
    if arr[mid] == target {
        return true
    }
    else if start == end {
        return false
    }
    else if arr[mid] < target {
        return binarySearch(arr: &arr, target: target, start: mid + 1, end: end)
    } else {
        return binarySearch(arr: &arr, target: target, start: start, end: mid - 1)
    }
}

// 같은 것들 중 첫번째 찾기
func findFirst(arr: inout [Int], target: Int) -> Int {
    var start = 0
    var end = arr.count
    while start < end {
        var mid = (start + end) / 2
        if arr[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }
    return start
}

// 같은 것들 중 마지막 번째 찾기
// end가 절대 target이 될 리 없음. 코앞까지 가더라도.
// target이 arr 안에 있으면 같은 값들 중 마지막 번째보다 1 큰 값을 리턴
// target이 arr 안에 없으면 target보다 큰 값 중 가장 가까운 값을 리턴
func findLast(arr: inout [Int], target: Int) -> Int {
    var start = 0
    var end = arr.count
    while start < end {
        var mid = (start + end) / 2
        if arr[mid] > target {
            end = mid
        } else {
            start = mid + 1
        }
    }
    return start
}


//let findFirstResult = findFirst(arr: &array, target: 8)
//print(findFirstResult)
//let findLastResult = findLast(arr: &array, target: 9)
//print(findLastResult)

