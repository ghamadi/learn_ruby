"""
This problem was asked by Stitch Fix.
Pascal's triangle is a triangular array of integers constructed with the following formula:
•	The first row consists of the number 1.
•	For each subsequent row, each element is the sum of the numbers directly above it, on either side.
For example, here are the first few rows:
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
Given an input k, return the kth row of Pascal's triangle.
Bonus: Can you do this using only O(k) space?
"""

def pascalKthRow(k)
    arr = Array.new(k) {|i| 0}
    arr[0] = 1
    (k-1).times do
        i = k - 1 
        while i > 0 
            arr[i] += arr[i-1]
            i -= 1
        end
    end
    return arr
end

testCases = [1, 2, 3, 4, 5]

testCases.each do |x|
    print("#{pascalKthRow(x)}\n")
end