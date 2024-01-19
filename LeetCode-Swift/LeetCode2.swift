//
//  LeetCode2.swift
//  LeetCode-Swift
//
//  Created by weather on 2024/1/17.
//

import Foundation

/*
 2. 两数相加
 
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution_2_1 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard var l1 = l1, var l2 = l2 else {
            return nil
        }
        var l1Array: [Int] = [l1.val]
        var l2Array: [Int] = [l2.val]
        var sum1 = l1.val
        var sum2 = l2.val
        while l1.next != nil {
            l1Array.append(l1.next!.val)
            sum1 += l1.next!.val * NSDecimalNumber(decimal: pow(10, l1Array.count - 1)).intValue
            l1 = l1.next!
        }
        
        while l2.next != nil {
            l2Array.append(l2.next!.val)
            sum2 += l2.next!.val * NSDecimalNumber(decimal: pow(10, l2Array.count - 1)).intValue
            l2 = l2.next!
        }

        let sum = sum1 + sum2
        var value = sum % 10
        var nextValue = sum / 10
        let node: ListNode = ListNode(value)
        var nextNode = node
        while nextValue != 0 {
            value = nextValue % 10
            nextValue /= 10
            let next = ListNode(value)
            nextNode.next = next
            nextNode = next
        }
        return node
    }
}

class Solution_2_2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l11 = l1
        var l22 = l2
        var head: ListNode?
        var tail: ListNode?
        var carry: Int = 0
        while l11 != nil || l22 != nil {
            let n1: Int = l11?.val ?? 0
            let n2: Int = l22?.val ?? 0
            let sum = n1 + n2 + carry
            if head == nil {
                head = ListNode(sum % 10)
                tail = head
            } else {
                tail?.next = ListNode(sum % 10)
                tail = tail?.next
            }
            carry = sum / 10
            l11 = l11?.next
            l22 = l22?.next
        }
        if carry > 0 {
            tail?.next = ListNode(carry)
        }
        return head
    }
}

class Solution_2_3 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l11 = l1
        var l22 = l2
        let head: ListNode? = ListNode()
        var tail = head
        var carry: Int = 0
        while l11 != nil || l22 != nil {
            let n1: Int = l11?.val ?? 0
            let n2: Int = l22?.val ?? 0
            let sum = n1 + n2 + carry
            tail?.next = ListNode(sum % 10)
            tail = tail?.next
            carry = sum / 10
            l11 = l11?.next
            l22 = l22?.next
        }
        if carry > 0 {
            tail?.next = ListNode(carry)
        }
        return head?.next
    }
}

class Solution_2_4 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l11 = l1
        var l22 = l2
        let result = ListNode()
        var current = result
        var sum = 0
        while l11 != nil || l22 != nil {
            if let link = l11 {
                sum += link.val
                l11 = link.next
            }
            if let link = l22 {
                sum += link.val
                l22 = link.next
            }
            current.next = ListNode(sum % 10)
            current = current.next!
            sum /= 10
        }
        if sum > 0 {
            current.next = ListNode(sum)
        }
        return result.next
    }
}
