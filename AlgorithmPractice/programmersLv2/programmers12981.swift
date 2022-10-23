//
//  programmers12981.swift
//  swift_algorithm
//
//  Created by 조성규 on 2022/10/18.
//

import Foundation

let n = 2
let words = ["hello", "one", "even", "never", "now", "world", "draw"]

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var pastWords: [String] = []
    for (idx, word) in words.enumerated() {
        if pastWords.contains(word) {
            return gameEnded(idx: idx, word: word)
        }
        if idx > 0 {
            let lastWord = words[idx - 1]
            if lastWord.last != word.first {
                return gameEnded(idx: idx, word: word)
            }
        }
        pastWords.append(word)
    }
    return [0, 0]
    
    func gameEnded(idx: Int, word: String) -> [Int] {
        let person = (idx % n) + 1
        let loop = Int(idx / n) + 1
        return [person, loop]
    }
}

let result = solution(n, words)
//print(result)
// ~~~~~~~~~~~~~~~~~~~~~~
