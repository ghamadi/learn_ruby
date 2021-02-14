require 'set'

def minBoats(list, k)
    boatCount = 0
    loaded = Set.new
    n = list.length
    iterations = 0
    for i in (0...n)
        minDiff = k
        x = list[i]
        iterations += 1
        if !loaded.include?(i)
            if x < k
                y = nil
                for j in ((i + 1)...n)
                    iterations += 1
                    temp = list[j]
                    diff = k - x - temp
                    if !loaded.include?(j) && diff >= 0 && diff < minDiff
                        y = j
                        minDiff = diff
                    end
                end
                loaded.add(y) unless y.nil?
            end
            loaded.add(i)
            boatCount += 1
        end
    end

    # puts "n = #{n}; i = #{iterations}"
    return boatCount
end

k = 200

testCases = [
    [100, 200, 150, 80],
    [10, 10, 190, 190],
    [200, 200, 200, 200],
]

for testCase in testCases
    puts "#{testCase.to_s.ljust(25)} #{'=>'.ljust(5)} #{minBoats(testCase, k)}"
end