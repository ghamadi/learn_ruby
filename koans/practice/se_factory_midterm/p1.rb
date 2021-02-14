
def checkIfSortedWithoutList
    asc = true
    desc = true
    j = nil

    print("Enter the number of integers: ")
    n = gets.chomp.to_i

    puts("Enter the #{n} integers:")
    while n > 0
        i = gets.chomp.to_i

        if !j.nil? && j < i 
            asc = false 
        elsif !j.nil? && i < j 
            desc = false 
        end

        j = i
        n -= 1
    end

    return asc || desc
end

def checkIfSortedWithList
    print("Enter integers sepearated by commas: ")
    str = gets.chomp
    arr = str.split(/,\s*/)
    asc = true
    desc = true
    for i in (0...arr.length-1)
        if (arr[i+1] < arr[i])
           asc = false
        elsif arr[i] < arr[i+1]
            desc = false
        end 
    end
    return asc || desc
end

puts("#{'Not ' if !checkIfSortedWithoutList}Sorted")