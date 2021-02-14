def map(s1, s2)
    if s1 == s2 
        return s1
    end
    
    combo = s1.to_s + s2.to_s
    case combo
    when 'RG'
        return 'B'
    when 'RB'
        return 'G'
    when 'GB'
        return 'R'
    when 'GR'
        return 'B'
    when 'BR'
        return 'G'
    when 'BG'
        return 'R'
    end
end

def solve(list, i)
    if list.length <= 1 || i >= list.length - 1
        return list
    elsif list[i] != list[i + 1]
        list[i + 1] = map(list[i], list[i + 1])
        solve(list[1...list.length], 0)
    else
        solve(list, i + 1)
    end
end

testCases = [
    ['R', 'G', 'B', 'G', 'B'],
    ['R', 'R', 'R', 'G', 'B'],
    ['R', 'G', 'G', 'B', 'G', 'B'],
    ['R', 'R', 'R', 'R'],
    ['R', 'B', 'G'],
    ['R'],
    []
]

print("\n")
for testCase in testCases
    print(testCase.to_s.ljust(32), "=>  ", solve(testCase, 0), "\n")
end
print("\n")