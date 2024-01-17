//
//  LeetCode_1.swift
//  LeetCode-Swift
//
//  Created by weather on 2024/1/16.
//

import Foundation

/*
 1. 两数之和
 
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。
 */

class Solution_1_1 {
    // 暴力枚举，时间复杂度：O(n^2)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for indexOne in 0..<nums.count {
            let first = nums[indexOne]
            for indexTwo in (indexOne+1)..<nums.count {
                if nums[indexTwo] == target - first {
                    return [indexOne, indexTwo]
                }
            }
        }
        return []
    }
}

class Solution_1_2 {
    // 暴力枚举，时间复杂度：O(n^2) enumerated
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (indexOne, first) in nums.enumerated() {
            for indexTwo in (indexOne+1)..<nums.count {
                if nums[indexTwo] == target - first {
                    return [indexOne, indexTwo]
                }
            }
        }
        return []
    }
    
}

class Solution_1_3 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (indexOne, first) in nums.enumerated() {
            let two = target - first
            var newNums = nums
            let equal = two == first
            if equal {
                newNums.remove(at: indexOne)
            }
            if let index = newNums.firstIndex(of: two) {
                let indexTwo = newNums.index(index, offsetBy: 0)
                return [indexOne, equal ? indexTwo + 1 : indexTwo]
            }
        }
        return []
    }
}

class Solution_1_4 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for (indexOne, one) in nums.enumerated() {
            let two = target - one
            // 字典中有值说明匹配到了，匹配到的是第一个元素，当前为第二个元素
            if let indexTwo = dict[two] {
                return [indexTwo, indexOne]
            }
            // 先遍历到的放字典中
            dict[one] = indexOne
        }
        return []
    }
}
