# Highly divisible triangular number
# Problem 12
# Dec 8, 2014

function num_divisors(n::Int)
  prod([v+1 for v in values(factor(n))])
end

num_div = 0
idx = 1
while num_div <= 500

  # increment
  idx = idx + 1

  # compute new number of divisors
  if iseven(idx)
    num_div = num_divisors(int(idx/2)) * num_divisors(idx+1)
  else
    num_div = num_divisors(idx) * num_divisors(int((idx+1)/2))
  end

end

println("Triangle #$idx ($(sum(1:idx))) has $num_div divisors.")
