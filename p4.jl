# Largest palindrome product
# Problem 4
# Dec 6 2014

# recursive function that checks if a string is a palindrome
function isPalindrome(str)

  # base case: string is one or zero characters
  if length(str) <= 1
    return true

  # if first and last characters match, call the function on the substring
  elseif str[1] == str[end]
    return isPalindrome(str[2:end-1])

  # if first and last characters do not match, string is not a palindrome
  else
    return false

  end
end

# store the biggest palindrome
biggest_palindrome = 0

# loop over large numbers
for i = 999:-1:1, j = 999:-1:1

  # compute the product
  prod = i*j

  # save the product if the product is a palindrome and bigger than the 
  if (prod > biggest_palindrome) & isPalindrome(string(prod))

    # print and save
    println("$i x $j = $prod is a bigger palindrome!")
    biggest_palindrome = prod

  end
end

