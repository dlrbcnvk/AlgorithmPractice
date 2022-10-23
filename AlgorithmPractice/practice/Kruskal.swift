// Kruskal

import Foundation

var vertices = ["A", "B", "C", "D"]
let edges = [
    (5,  "A", "B"),
    (1,  "A", "C"),
    (10, "A", "D"),
    (8,  "C", "D"),
    (3,  "B", "D"),
]

typealias edge = (Int, String, String)

func kruskal(vertices: [String], edges: [edge]) -> [edge] {
    var mst: [edge] = []
    
    var edges = edges.sorted(by: { $0.0 < $1.0 })
    var rank: [String: Int] = [:]
    var parent: [String: String] = [:]
    
    for vertice in vertices {
        rank.updateValue(0, forKey: vertice)
        parent.updateValue(vertice, forKey: vertice)
    }
    
    func find(_ node: String) -> String {
        var node = node
        while node != parent[node]! {
            node = parent[node]!
        }
        return node
    }
    
    func union(_ nodeV: String, _ nodeU: String) {
        let rootV = find(nodeV)
        let rootU = find(nodeU)
        
        if rank[rootV]! > rank[rootU]! {
            parent[rootU] = rootV
        } else {
            parent[rootV] = rootU
            if rank[rootV]! == rank[rootU]! {
                rank[rootU]! += 1
            }
        }
    }
    
    while mst.count < vertices.count - 1 {
        let node = edges.removeFirst()
        if find(node.1) != find(node.2) {
            union(node.1, node.2)
            mst.append(node)
        }
    }
    
    print(parent)
    print(rank)
    return mst
}

let kruskalResult = kruskal(vertices: vertices, edges: edges)
print(kruskalResult)

