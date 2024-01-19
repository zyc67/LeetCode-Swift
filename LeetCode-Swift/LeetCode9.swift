//
//  LeetCode9.swift
//  LeetCode-Swift
//
//  Created by weather on 2024/1/18.
//

import Foundation

/*
 9. 回文数
 
 给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。

 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 例如，121 是回文，而 123 不是。
 */

class Solution_9_1 {
    func isPalindrome(_ x: Int) -> Bool {
        let str = String(x)
        var first = 0
        var last = str.count - 1
        while first <= last {
            let head = str[str.index(str.startIndex, offsetBy: first)]
            let tail = str[str.index(str.endIndex, offsetBy: -1 - first)]
            if head == tail {
                if first == last || first + 1 == str.count / 2 {
                    return true
                }
                first += 1
                last -= 1
            } else {
                return false
            }
        }
        return false
    }
}

class Solution_9_2 {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var str = String(x)
        while str.count > 1 {
            if str.removeFirst() != str.removeLast() {
                return false
            }
        }
        return true
    }
}

class Solution_9_3 {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        let str = String(x)
        return str == String(str.reversed())
    }
}

class Solution_9_4 {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var reverseNum = 0
        var xx = x
        while xx > reverseNum {
            reverseNum = reverseNum * 10 + xx % 10
            xx /= 10
        }
        return xx == reverseNum || xx == reverseNum / 10
    }
}

