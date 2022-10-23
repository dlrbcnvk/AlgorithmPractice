//
//  MinHeap.swift
//  AlgorithmPractice
//
//  Created by 조성규 on 2022/10/23.
//

import Foundation

// MaxHeap
// 시간복잡도: O(logn)
// 우선순위 큐 같이 최댓값, 최솟값을 빠르게 찾아야 하는 알고리즘이나 자료구조에 활용됨

import Foundation

struct MinHeap<T: Comparable> {
    var heap: Array<T> = []
    
    enum moveDownStatus { case none, left, right }
    
    init() { }
    init(_ data: T) {
        heap.append(data) // 0번 index 채우기용
        heap.append(data) // 실제 root node 채우기
    }
    
    mutating func insert(_ data: T) {
        if heap.count == 0 {
            heap.append(data)
            heap.append(data)
            return
        }
        
        heap.append(data)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 { // 루트 노드일 때
                return false
            }
            let parentIndex: Int = insertIndex / 2
            return heap[insertIndex] < heap[parentIndex] ? true : false
        }
        
        var insertIndex: Int = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex: Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = (poppedIndex * 2)
            let rightChildIndex = leftChildIndex + 1
            
            // case 1. 모든(왼쪽) 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지므로)
            if leftChildIndex >= heap.count {
                return .none
            }
            
            // case 2. 왼쪽 자식 노드만 있는 경우
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] < heap[poppedIndex] ? .left : .none
            }
            
            // case 3. 왼쪽 & 오른쪽 자식 노드 모두 있는 경우
            // case 3-1. 자식들이 자신보다 모두 큰 경우
            if (heap[leftChildIndex] > heap[poppedIndex] && heap[rightChildIndex] > heap[poppedIndex]) {
                return .none
            }
            
            // case 3-2. 자신보다 자식들이 모두 작은 경우 (왼쪽과 오른쪽 자식 중 더 큰 자식 선별)
            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightChildIndex] < heap[poppedIndex]) {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
            }
            
            // case 3-3. 왼쪽 & 오른쪽 자식 중 한 자식만 자신보다 큰 경우
            return heap[leftChildIndex] < heap[poppedIndex] ? .left : .right
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
            }
        }
    }
}
