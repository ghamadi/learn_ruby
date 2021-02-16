"""
This problem was asked by Netflix.

Given an array of integers, determine whether it contains a Pythagorean triplet. 
Recall that a Pythogorean triplet (a, b, c) is defined by the equation a2+ b2= c2.
"""

"""
brute force => n^3

    sort (n logn)
    hold a,
        look for valid b
        hold b
            look for valid c after b
            check if pythagorean
            repeat if not
        repeat if no pythagorean found

"""

def hasPythagoreanTripletBruteForce(list) 
    arr = list.sort.reverse
    i = -1
    arr[0..-3].each do |a|
        i += 1
        arr[i+1..-2].each do |b|
            arr[i+2..-1].each do |c|
                return true if a*a == b*b + c*c
            end
        end
    end
    return false
end

def hasPythagoreanTripletOptimized(list)
    arr = list.sort.reverse
    edge = arr.length
    
    i = 0
    while i < edge - 2
        i += 1
        a = arr[i]
        j = i + 1
        while j < edge - 1
            b = arr[j]
            k = j + 1
            j += 1
            while k < edge 
                c = arr[k]
                break if  ((b*b + c*c < a*a) or (a == b) or (a == c))
                return true if a*a == b*b + c*c
                k += 1
            end
        end
    end
    return false
end

require 'benchmark'

def runBenchmark
    arr = [ 6, 8, 10]
    50.times {
        arr << rand(100)
    }

    n = 5000
    
    Benchmark.bm(20) do |x|
        puts"#{hasPythagoreanTripletOptimized(arr)} => #{arr.sort.reverse}"
        x.report("optimized?")      { n.times { hasPythagoreanTripletOptimized(arr) } }
        puts"#{hasPythagoreanTripletBruteForce(arr)} => #{arr.sort.reverse}"
        x.report("brute force")     { n.times { hasPythagoreanTripletBruteForce(arr) } }
    end
end


runBenchmark