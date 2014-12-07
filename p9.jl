# Special Pythagorean triplet
# Problem 9
# Dec 7 2014

for a = 1:1000, b = 1:1000
  c = sqrt(a^2 + b^2)
  if (a + b + c) == 1000
    prod = a*b*c
    println("a = $a, b = $b, c = $c. a*b*c = $prod")
    break;
  end
end
