=begin
creating 2 sets of methods
-first set of methods

a(n) = # of katas done by Ann at day n
A(j) = # of katas done by john at day n

On day  n the # of katas done by Ann == n - # of katas done by john at day 't'
't' == the # of katas done herself at day 'n' - 1 (the previous day)

On day 'n' the # of katas done by John == 'n' minus the # of katas done by Ann on day t
t == # of katas done by john the previous day (n - 1)

a(0) = 1
a(0) = 0

a(1) =
function 
return the list of the number of katas ann/jogn does on the first 'n' days
return an array, given an integer representing the first 'n days'
john(n)  [0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6]
day one: 0, day 2 : 0, day3: 1. day 4: 1, day 5 : 0 
+0,  +0 , +1 ,+1 , +0, +1, +1, +0 +1, +1, + 0,
john does 0 on the first day, 
0 on one day, 1 each day for the next 2 days, 0 on the next day, 2 the next 2 days after doing 0

ann(n) [1, 1, 2, 2, 3, 3]
ann : day1 : 1, day2: 0, day3: 0, day4:
+1, +0, +1, +0, +1, +0

1,
0

they have a pattern
1, 0, 1, 0
0, 1, 1, 0, 1, 1

create an array of the number of katas they've done to date:
data strucutre:
using an array
the elements will represent a running count of how many problems they've done up to date
return the array

intialize 'count' to an array with one element, john 0, ann 1
loop the numver of dats specified.
-add an element to the array depending on the pattern.
-john : idx is evenly divisble by 3, don't increment the count, add to the array a duplicate of the last element
-ann : increment the element that will be appended if the idx is even. odd , append the last element duplicate

return the array


0, 1, 2, 2, 3, 4, 4, 5, 6, 6]
=end




# def a(n)
#   return 1 if n == 0
#   n - j(a(n - 1))
# end

# def j(n)
#   return 0 if n == 0
#   n - a(j(n - 1))
# end  

# def john(n)
#   a = []
#   n.times { |n| a << j(n) }
#   a
# end


# def katas_count_list(n)
#   ann = [1]
#   john = [0]
  
#   1.upto(n - 1) do |n|
#     john << (n - ann[john[n - 1]])
#     ann << (n - john[ann[n - 1]])
#   end
  
#   [ann, john]
# end

# def john(n)
#   katas_count_list(n).last
# end

# def ann(n)
#   katas_count_list(n).first
# end


# def ann(n)
#   ann = [1]
#   john = [0]
  
#   1.upto(n - 1) do |n|
#     john << (n - ann[john[n - 1]])
#     ann << (n - john[ann[n - 1]])
#   end
  
#   ann


# def ann(n)
#   a = []
#   n.times { |n| a << a(n) }
#   a
# end

# def sum_john(n)
#   john(n).sum
# end

# def sum_ann(n)
#   ann(n).sum
# end

# p sum_john(75)
# p sum_ann(150)

# p john(11)

# p jonn(11).sum


=begin
given 3 integers:
-first represents the gap we want to match, integer value to match
-2nd represents start of the range of numbers to look 
-3rd represents the end of the range of numbers to look

-looking only for prime numbers (# only divisble by itself or 1)
-looking at the difference between primes.
-return an array containing the first pair of primes whos difference matches the 1st integer argument

implicit: 
- the difference between the return value is negative,
2, 5 == 2 - 5 == -3.
- the return array is in order, least primer number first, larger prime number follows


data strucutre: array
use an array that will be mutated as necessary

algo:
iterate over the range of numbers
append to an array the primes
if the difference between the primes matches the gap, return the array

intialize an empty array called 'primes'
iterate over a range starting at the 2nd integers given, up to the 3rd integer given, passing in each integer and namign it 'idx'
  append the number to the prime arra if it is a prime?
  if the size of the array is 2,
    evaluate the difference between the 2 elements in the array
    -if the difference matches the gap, return the array
    -else delete the first element in the array
  
nil
  
  
  

is a prime?

iterate from 2 up to one less than the number, passsing in each number and assigning it to the block paramater 'num'
-return false if the number is evenly divisible by the 'num'
end
return true.
=end

# def prime?(num)
#   !!(2...num).each { |n| return false if num % n == 0}
# end

# def gap(g, m, n)
#   primes = []
#   (m..n).each do |num|
#     primes << num if prime?(num)
#     p primes
#     if primes.size > 1
#       return primes if primes.last - primes.first == g
#       primes.shift
#     end
#   end
  
#   nil
# end


# def gap(g, m, n)
#   primes = []
#   (m..n).each { |num| primes << num if prime?(num)}
  
#   p primes
#   primes.each_with_index do |prime, idx|
#     break if idx == primes.size - 1
#     pair = [prime, primes[idx + 1]]
#     return pair if pair[-1] - pair[-2] == g
#   end
  
#   nil
# end


# def gap(g, m, n)
#   primes = []
#   (m..n).each do |num|
#     if prime?(num)
#       primes << num
#       break
#     end
#   end
  
#   loop do
#     prime = primes.last
#     p primes
#     break if prime > n
    
#     p prime
#     p prime + g
#     if prime?(prime + g)
#       return [prime] << prime + g
#     else
#       (prime + 1..n).each do |num|
#         if prime?(num)
#           primes << num
#           break
#         end
#       end
#     end
#   end
  
#   nil
# end

# require 'prime'

# def gap(g, m, n)
#   primes = []
  
#   # Prime.each do |prime|
#   #   break if prime > n
#   #   primes << prime
#   #   if primes.size > 1
#   #     pair = [primes[-2], primes[-1]]
#   #     return pair if pair.last - pair.first == g
#   #   end
#   # end
    
#   (m..n).each do |num|
#       primes << num if num.prime?
#       if primes.size > 1
#         pair = [primes[-2], primes[-1]]
#         return pair if pair.last - pair.first == g
#       end
#     end
  
#   nil
# end



# p gap(2,3,50)
# p gap(10, 300, 400)


# def next_smaller n
#   digits = n.digits.sort
#   return -1 if n.to_s.chars.map(&:to_i) == digits
  
#   loop do
#     n-= 1
#     n_digits = n.digits
#     break if n_digits.size < digits.size 
#     return n if n_digits.sort == digits
#   end
  
#   -1
# end


def substrings(str)
  (0...str.size).each.with_object([]) do |idx, substring|
    (idx...str.size).each do |idx2|
      current_substring = str[idx..idx2]
      substring << current_substring if current_substring.size == str.size 
      end
    end
end

p substrings('string')

def next_smaller(n)
  digits = n.to_s.chars
  return -1 if digits == digits.sort
  
  1.upto(n.size - 1) do |n|
    cdigits = digits.last(n + 1)

    next if cdigits.sort == cdigits
    num_strings = substrings(cdigits).sort.reverse
    num_strings.each do |num_str|
      if num_str.to_i < cdigits.join.to_i
        digits.pop(n + 1)
        digits = digits << num_str
      end
    end
    break
  end
  digits.join.to_i
end

p next_smaller(1234567908)
# p next_smaller(907)
# p next_smaller(531)
# p next_smaller(2071)
# p next_smaller(123456789)