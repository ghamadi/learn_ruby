"""
This problem was asked by Netflix.

Given an array of integers, determine whether it contains a Pythagorean triplet. 
Recall that a Pythogorean triplet (a, b, c) is defined by the equation a2+ b2= c2.
"""

def hasPythagoreanTripletBruteForce(arr) 
    i = -1
    arr[0..-3].each do |a|
        i += 1
        arr[i+1..-2].each do |b|
            arr[i+2..-1].each do |c|
                return true if a*a == b*b + c*c or b*b == a*a + c*c or c*c == b*b + a*a
            end
        end
    end
    return false
end