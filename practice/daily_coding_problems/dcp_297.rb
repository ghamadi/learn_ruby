"""
This problem was asked by Amazon.

At a popular bar, each customer has a set of favorite drinks, and will happily accept any drink among this set. For example, in the following situation, customer 0 will be satisfied with drinks 0, 1, 3, or 6.

preferences = {
    0: [0, 1, 3, 6],
    1: [1, 4, 7],
    2: [2, 4, 7, 5],
    3: [3, 2, 5],
    4: [5, 8]
}

A lazy bartender working at this bar is trying to reduce his effort by limiting the drink recipes he must memorize. Given a dictionary input such as the one above, return the fewest number of drinks he must learn in order to satisfy all customers.
For the input above, the answer would be 2, as drinks 1 and 5 will satisfy everyone.

"""
require 'set'

def minNumOfDrinks(prefs)
    def helper(prefs, drinksHash, minList, j)

        # if minList.length == 1 there can be no shorter list
        if j == drinksHash.length - 1 or minList.length == 1
            return minList
        end 
        
        satisfiedCustomers = Set[] + drinksHash.values[0] 
        tempMinList = Set[drinksHash.keys[0]]

        drinks = drinksHash.keys

        for i in (j...drinks.length)
            customers = drinksHash[drinks[i]]
            customers.each do |c|
                if !satisfiedCustomers.include?(c)
                    tempMinList << drinks[i]
                    satisfiedCustomers << c
                    break if satisfiedCustomers.length == prefs.length
                end
            end
            break if minList.length == 1 # optimization
        end
        
        # only update minList if the tempMinList satisfies all customers
        if satisfiedCustomers.length == prefs.length
            minList = tempMinList if minList.empty? or (minList.length > tempMinList.length)
        end

        helper(prefs, drinksHash, minList, j + 1)
    end

    drinksHash = invertMap(prefs)
    return helper(prefs, drinksHash, [], 1).to_a
end


def invertMap(dict) 
    result = {}
    dict.each do |customer, drinks|
        drinks.each do |drink|
            if result[drink].nil?
                result[drink] = Set[customer]
            else
                result[drink] << customer
            end
        end
    end
    # sort in reverse order => First drink satisfies most customers
    return result.sort_by {|k, v| -v.length}.to_h 
end

testCases = [
    preferences = {
        0 => [0, 1, 3, 6],
        1 => [1, 4, 7],
        2 => [2, 4, 7, 5],
        3 => [3, 2, 5],
        4 => [5, 8]
    }
]

for testCase in testCases
    print(minNumOfDrinks(testCase))
end