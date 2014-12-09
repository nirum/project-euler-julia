# Factorial digit sum
# Problem 20
# Dec 8, 2014

function splt(num::Int)
  int(split(string(num),""))
end

function multiply_digit(num::String, x::Int)

  # split the string
  arr = split(num, "")
  d = length(arr)

  # store products in a matrix
  mtx = zeros(Int, d, d+2)

  # fill the matrix
  for r = d:-1:1
    prod = splt(int(arr[r]) * x)
    mtx[r,(r-length(prod)+3):(r+2)] = prod
  end

  # map overflow
  total = sum(mtx,1)
  for idx = length(total):-1:2
    if total[idx] >= 10
      cur_value = total[idx]
      total[idx] = mod(cur_value,10)
      total[idx-1] = total[idx-1] + int(floor(cur_value/10))
    end
  end

  # return the sum, as a string
  replace(replace(mapreduce(x->string(x), *, total), r"^0*", ""), r"0*$", "")

end

function multiply(num::String, x::Int)
  if x > 10
    tens = split(multiply_digit(num, int(floor(x/10))) * "0", "")
    ones = split("0"*multiply_digit(num, mod(x,10)), "")

    println("tens: $(length(tens))")
    println("ones: $(length(ones))")
    res = zeros(Int,length(ones))
    for idx = length(res):-1:2
      value = int(tens[idx]) * int(ones[idx])
      res[idx] = res[idx] + mod(value,10)
      res[idx-1] = res[idx-1] + int(floor(value/10))
    end
  else
    return multiply_digit(num, x)
  end
end

# compute the factorial
f = "1"
for i = 2:100
  f = multiply_digit(f, i)
end
total = mapreduce(x->int(x), +, split(f, ""))
println("Sum of the digits in 100! is $total")
