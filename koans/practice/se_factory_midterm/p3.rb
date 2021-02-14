def consecutiveDivisors(n)
    for i in (2...n-1)
        if (n % i == 0) && (n % (i + 1)) == 0
            return true
        end
    end 
    return false
end

def longestRunConsecutiveDivisors(n)
    maxL = 0
    i = 2
    while i <= n
        if (n % i == 0)
            temp = 1
            while (n % i == 0) && (n % (i + 1)) == 0
                temp += 1
                i += 1
            end
            maxL = temp if temp > maxL
        end
        i += 1
    end
    return maxL
end 

testCases = [2, 4, 6, 10,12,18,20,31, 48, 1470]

for testCase in testCases
    puts "#{testCase.to_s.ljust(5)} => #{consecutiveDivisors(testCase).to_s.ljust(6)} => #{longestRunConsecutiveDivisors(testCase).to_s.rjust(4)}"
end

