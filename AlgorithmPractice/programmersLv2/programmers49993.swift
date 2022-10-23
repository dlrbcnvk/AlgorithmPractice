// programmers Lv2 49993

import Foundation

let skill: String = "CBD"
let skill_trees: [String] = ["BACDE", "CBADF", "AECB", "BDA"]

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var count = 0
    var skillTrue: Bool = true
    
    let skillStack = skill.map { char in
        String(char)
    }
    let skillIdx = 0
    
    for tree in skill_trees {
        var skillStackTemp = skillStack
        let treeStack = tree.map { char in
            String(char)
        }
        skillTrue = true
        for str in treeStack {
            if skillStackTemp.first == str {
                skillStackTemp.removeFirst()
            } else if skillStackTemp.first != str && skillStackTemp.contains(str) {
                skillTrue = false
                break
            }
        }
        if skillTrue {
            count += 1
        }
    }
    return count
}

let result = solution(skill, skill_trees)
//print(result)
