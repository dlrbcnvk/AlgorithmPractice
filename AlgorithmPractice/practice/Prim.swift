// Prim algorithm
// 최소신장트리

import Foundation

struct Edge: Comparable {
    var start: String = ""
    var dest: String = ""
    var weight: Int = 0
    
    init(_ start: String, _ dest: String, weight: Int) {
        self.start = start
        self.dest = dest
        self.weight = weight
    }
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.weight < rhs.weight
    }
}

let vertices = ["A", "B", "C", "D"]
let edges: [Edge] = [ // 양방향 셋팅 (예시)
    .init("A", "B", weight: 5),
    .init("A", "C", weight: 1),
    .init("A", "D", weight: 10),
    .init("B", "A", weight: 5),
    .init("B", "D", weight: 3),
    .init("C", "A", weight: 1),
    .init("C", "D", weight: 8),
    .init("D", "A", weight: 10),
    .init("D", "B", weight: 3),
    .init("D", "C", weight: 8),
]

typealias edge = (Int, String, String)

func prim(start: String, vertices: [String], edges: [Edge]) -> [edge]? {
    var mst: [edge] = []                                // 선택 리스트
    var edgeList = MinHeap<Edge>()                      // 간선 리스트
    var connectedNode: Set<String> = []                 // 연결된 노드 집합
    var adjacentEdges: [String: [Edge]] = [:]           // 모든 노드에 연결된 모든 간선을 저장하는 딕셔너리
    
    for vertice in vertices {
        adjacentEdges.updateValue([], forKey: vertice)
    }
    for edge in edges {
        adjacentEdges[edge.start]?.append(edge)
    }
    
    guard let startEdges = adjacentEdges[start] else { return nil }
    
    connectedNode.insert(start)                         // 처음 선택된 노드를 연결된 노드 집합에 삽입
    for edge in startEdges {                            // 처음 선택된 노드에 대한 간선들을 간선 리스트에 삽입
        edgeList.insert(edge)
    }
    
    while mst.count < vertices.count {
        guard let poppedEdge = edgeList.pop() else { break }
        if connectedNode.contains(poppedEdge.dest) { continue }
        
        mst.append((poppedEdge.weight, poppedEdge.start, poppedEdge.dest))
        connectedNode.insert(poppedEdge.dest)
        
        guard let destEdges = adjacentEdges[poppedEdge.dest] else { return nil }
        for edge in destEdges {
            if !connectedNode.contains(edge.dest) {
                edgeList.insert(edge)
            }
        }
    }
    
    return mst
}

let primResult = prim(start: "A", vertices: vertices, edges: edges)
print(primResult ?? [])
