"""
This problem was asked by Facebook.

On a mysterious island there are creatures known as Quxes which come in three colors: red, green, and blue. One power of the Qux is that if two of them are standing next to each other, they can transform into a single creature of the third color.
Given N Quxes standing in a line, determine the smallest number of them remaining after any possible sequence of such transformations.

For example, given the input ['R', 'G', 'B', 'G', 'B'], it is possible to end up with a single Qux through the following steps:

        Arrangement       |   Change
----------------------------------------
['R', 'G', 'B', 'G', 'B'] | (R, G) -> B
['B', 'B', 'G', 'B']      | (B, G) -> R
['B', 'R', 'B']           | (R, B) -> G
['B', 'G']                | (B, G) -> R
['R']                     |

"""
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