# Largest prime factor
# Problem 3
# Dec 5 2014

n = 600851475143

print("Prime factors: ")
for j in 1:sqrt(n)
  if mod(n,j) == 0
    print("$j, ")
    n = n / j
  end
end
