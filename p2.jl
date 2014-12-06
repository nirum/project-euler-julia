# Even Fibonacci numbers
# Problem 2
# Dec 5 2014

# store total
total = 0

# store values in fibonacci sequence
fib = [1,1,2]
val = 2

# loop over fib sequence
while val <= 4e6

  # check if even
  if mod(val, 2) == 0
    total = total + val
  end

  # generate next entry
  fib = [fib[2:3], fib[2]+fib[3]]
  val = fib[3]

end
println("The total is: $total")
