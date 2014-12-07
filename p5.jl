# Smallest multiple
# Problem 5
# Dec 6 2014

# maximum integer
maxval = 20

# build the function to merge dictionaries of factors
function mergeFactors(f1, f2)

  if f1 == None
    return f2
  else

    # build the new dictionary
    f = merge(f1,f2)

    # loop over keys
    for key in intersect(keys(f1), keys(f2))
      f[key] = max(f1[key],f2[key])
    end

    return f
  end

end

# build a dictionary containing all of the prime factors our number needs
res = mapreduce(x->factor(x), mergeFactors, 1:maxval)

# multiply the keys in the result n times, where n is the value
prod = 1
for key in keys(res)
  prod = prod * (key^res[key])
end

# print the number
println("The smallest number evenly divisible by the numbers from 1 to $maxval is $prod")
