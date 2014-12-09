# 1000-digit Fibonacci number
# Problem 25
# Dec 8, 2014

function add(n1::String, n2::String)

  arr1 = split(n1,"")
  arr2 = split(n2,"")

  total = zeros(Int, max(length(arr1),length(arr2))+1)
  for idx = 0:(length(total)-2)

    if idx >= length(arr1)
      v1 = 0
    else
      v1 = arr1[end-idx]
    end

    if idx >= length(arr2)
      v2 = 0
    else
      v2 = arr2[end-idx]
    end
    
    value = int(v1) + int(v2) + total[end-idx]
    total[end-idx] = mod(value,10)
    total[end-idx-1] = total[end-idx-1] + int(floor(value/10))

  end
  replace(mapreduce(x->string(x), *, total), r"^0*", "")

end

f1 = "1"
f2 = "1"
idx = 3
while length(f2) < 1000
  new_term = add(f1,f2)
  f1 = f2
  f2 = new_term
  println("F[$idx] has $(length(f2)) digits.")
  idx = idx + 1
end
