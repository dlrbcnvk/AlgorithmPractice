import Foundation
// programmers lv1 86491 최소직사각형

func solution(_ sizes:[[Int]]) -> Int {
    var width = sizes[0][0]
    var height = sizes[0][1]
    if sizes.count == 1 {
        return width * height
    }
    var minsquare = 3000222
    for idx in 1...(sizes.count-1) {
        let newWidth = sizes[idx][0]
        let newHeight = sizes[idx][1]
        let result1 = (width < newWidth ? newWidth : width) * (height < newHeight ? newHeight : height)
        let result2 = (width < newHeight ? newHeight : width) * (height < newWidth ? newWidth : height)
        
        if result1 < result2 {
            minsquare = result1
            width = width < newWidth ? newWidth : width
            height = height < newHeight ? newHeight : height
        } else {
            minsquare = result2
            width = width < newHeight ? newHeight : width
            height = height < newWidth ? newWidth  : height
        }
    }
    
    return minsquare
}

let result = solution([[60, 50], [30, 70], [60, 30], [80, 40]])
print(result)
