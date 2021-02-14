
def solve(num, steps)
    if num == 6174 
        return steps
    end

    arr = num.to_s.scan(/\d/)
    right = arr.sort
    left = right.reverse

    left = left.join
    right = right.join
    
    num = left.to_i - right.to_i

    print "#{left} - #{right} = #{num}\n"

    solve(num, steps + 1)
end
puts ""
puts "--------------------\nTOTAL STEPS = #{solve(1244, 0)}\n\n"
