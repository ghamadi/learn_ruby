def checkZeroes(list)
    for i in list
        return true if i == 0
    end
    return false
end

def recursiveCheckZeroes(list)    
    def helper(list, index)
        if index == list.length
            return false
        elsif list[index] == 0
            return true
        else
            helper(list, index + 1)
        end 
    end
    return helper(list, 0)
end



def moveZeroes(list)
    i = 0
    n = list.length

    while true
        while i < n && list[i] != 0
            i += 1
        end
        
        j = i
        
        while j < n && list[j] == 0
            j += 1
        end

        break if i == n || j == n

        list[i], list[j] = list[j], list[i]
    end

    return list
end


testCases = [
    [1,2,0,1,0],
    [1,2,3,4,5],
    [0,0,0,0,1],
    [0,0,0,0,0],
    [1,2,3,4,5]
]

puts 
for testCase in testCases
    puts "#{testCase} => #{moveZeroes(testCase)}"
end 
puts 