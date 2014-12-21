# Pandigital multiples
# Problem 38
# Dec 21, 2014

# truncate a digit off of a number
function truncate(num::Int)
  if num < 10
    return (0, num)
  else
    digits = split(string(num),"")
    return (int(reduce(string, "", digits[2:end])), int(digits[1]))
  end
end

# count the number of digits in a number
function num_digits(num::Int)
  length(split(string(num), ""))
end

# check if number is valid
function valid(num::Int)
  digits = split(string(num), "")
  counts = zeros(10)
  for d in digits
    idx = int(d) + 1
    counts[idx] = counts[idx] + 1
    if (counts[idx] > 1) | (counts[1] > 0)
      return false
    end
  end
  return true
end

# function to check if a number is pandigital
function pandigital(num::String, dim::Int=9)

  if length(num) != dim
    return false
  end

  digits = zeros(dim)
  num, digit = truncate(int(num))

  while digit != 0
    if digits[digit] != 0
      return false
    else
      digits[digit] = 1
    end
    num, digit = truncate(num)
  end

  if sum(digits) == dim
    return true
  else
    return false
  end
end

# search for pandigital multiples
for n = 2:9
  arr = 1:n
  println(">>>>>> n is $n")
  for idx in 1:10000
    if valid(idx)
      str = join(map(string, idx*arr))
      if pandigital(str)
        println("$idx x (1:$n) = $str is pandigital!")
      end
    end
  end
end
