# Sum square difference
# Problem 6
# Dec 7 2014

n = 100
total = 0

for i = 1:n
  total = total + i * (sum(1:n) - i)
end
println("The sum square of the first $n numbers is $total.")
