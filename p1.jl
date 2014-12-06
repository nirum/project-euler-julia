# Multiples of 3 and 5
# Problem 1
# Dec 5 2014

total = 0
for j in 1:999
  if mod(j,3) == 0 || mod(j,5) == 0
    total += j
  end
end
println(total)
