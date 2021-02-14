"""
RANK: EASY

A girl is walking along an apple orchard with a bag in each hand. She likes to pick apples from each tree as she goes along, but is meticulous about not putting different kinds of apples in the same bag.
Given an input describing the types of apples she will pass on her path, in order, determine the length of the longest portion of her path that consists of just two types of apple trees.

For example, given the input [2, 1, 2, 3, 3, 1, 3, 5], the longest portion will involve types 1 and 3, with a length of four.
"""

require 'set'

def longestPortion(arr)
    portion = []
    for i in (0..arr.length - 1)
        temp = [arr[i]]
        types = Set[arr[i]]

        for j in (i+1..arr.length)
            types << arr[j]
            break if types.length > 2
            temp << arr[j]
        end
        
        portion = temp if temp.length > portion.length
        break if portion.length >= arr.length - i + 1
    end
    return portion
end



testCases = [
    (0..100).to_a,
    [1, 3, 3, 3, 3, 1, 3, 5],
    [3, 3, 3, 3, 3, 1, 1, 1],
    [1, 2, 2, 3, 3, 3, 4, 5],
    [1, 2, 2, 2, 3, 3, 3, 3]
]

for testCase in testCases
    portion = longestPortion(testCase)
    print "#{portion.length} => #{portion} \n"
end