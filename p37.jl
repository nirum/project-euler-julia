# Truncatable primes
# Problem 37
# Dec 17, 2014

function truncate_left(num::Int)
  if num < 10
    return 0
  else
    digits = split(string(num),"")
    int(reduce(string, "", digits[2:end]))
  end
end

function truncate_right(num::Int)
  if num < 10
    return 0
  else
    digits = split(string(num),"")
    int(reduce(string, "", digits[1:end-1]))
  end
end

function is_truncatable(num::Int)

  # make sure it is prime and above 9
  if (!isprime(num) || num < 10)
    return false
  end

  # check right
  n = truncate_right(copy(num))
  while n > 0
    if !isprime(n)
      return false
    end
    n = truncate_right(n)
  end

  # check left
  n = truncate_left(copy(num))
  while n > 0
    if !isprime(n)
      return false
    end
    n = truncate_left(n)
  end

  # all done!
  return true
end

p = primes(1000000)
trunk = Int[]
idx = 1

while length(trunk) < 11
  if is_truncatable(p[idx])
    println("$(p[idx]) is prime and is truncatable!")
    push!(trunk, p[idx])
  end
  idx = idx + 1
end

println("The sum of the 11 truncatable numbers is $(sum(trunk))")
