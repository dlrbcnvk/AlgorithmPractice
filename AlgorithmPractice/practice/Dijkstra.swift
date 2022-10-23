// Dijkstra 다익스트라
// 단일출발 최단경로 문제
// 우선순위 큐 사용

import Foundation

let graph: [String: [String: Int]] = [
    "A" : ["B": 9, "C" : 1, "D" : 15],
    "B" : ["E": 10],
    "C" : ["B": 5, "E" : 3],
    "D" : ["E": 10],
    "E" : ["F": 7],
    "F" : [:]
]

struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        lhs.priority > rhs.priority
    }
    var node: String = ""
    var priority: Int = 0
}

func dijkstra(graph: [String: [String: Int]], start: String) -> [String: Int] {
    var distances: [String: Int] = [:]
    var priorityQueue = MaxHeap(NodePriority.init(node: start, priority: 0))
    
    for key in graph.keys {
        let value = key == start ? 0 : Int.max
        distances.updateValue(value, forKey: key)
    }
    
    while !priorityQueue.heap.isEmpty {
        guard let popped = priorityQueue.pop() else { break }
        
        if distances[popped.node]! < popped.priority {
            continue
        }
        
        for (node, priority) in graph[popped.node]! {
            let distance = popped.priority + priority
            if distance < distances[node]! {
                distances[node] = distance
                priorityQueue.insert(NodePriority.init(node: node, priority: distance))
            }
        }
    }
    return distances
}

//let result = dijkstra(graph: graph, start: "A")
//print(result)
