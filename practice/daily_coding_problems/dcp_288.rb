
def solve(num, steps)
    if num == 6174 
        return steps
    end

    right = num.to_s.scan(/\d/).sort
    left = right.reverse

    left = left.join
    right = right.join
    
    num = left.to_i - right.to_i

    print "#{left} - #{right} = #{num}\n"

    return solve(num, steps + 1)
end

puts ""
puts "--------------------\nTOTAL STEPS = #{solve(1234, 0)}\n\n"

obj = {test: 123, test2:"alo"}

puts obj