#########################
#### USING ARGUMENTS ####
#########################
#say_hello
  # returns 'hello'

def say_hello
  return "hello"
end

#echo
  # echoes (returns) the input string

def echo (str)
  return str
end

#get_fruit
  # returns the fruit that corresponds to the given id
  # does not raise an error when the id argument is missing
  # defaults to 'apple' when no id argument is supplied

def get_fruit(id = 0)
  fruits = ['apple','pear']
  return fruits[id]
end

#how_many_args
  # accepts any number of arguments without error
  # returns the total number of arguments passed to the function

def how_many_args(*arg)
  arg.count
end

#find_answer
  # returns the value associated with the 'answer' keyword argument
  # returns nil if it cannot find the 'answer' keyword argument
  # raises an error when given non-keyword arguments

def find_answer(**thing)
  thing[:answer]
end

##############################
#### MANIPULATING STRINGS ####
##############################
#first_char
  # returns the first letter of the given word
  # lowercases the first letter of the given word

def first_char (word)
  return word.chars.first.downcase
end

#polly_wanna
  # includes the given word in its return value
  # repeats the given word 3 times

def polly_wanna (word)
  return word*3
end

#count_chars
  # returns the number of characters in the given string

def count_chars (word)
  word.length
end

#yell
  # convert the given message to uppercase
  # adds an exclamation point to the end of the given message

def yell (str)
  str.upcase + '!'
end

#to_telegram
  # replaces periods in the input string with ' STOP'

def to_telegram (str)
  str.gsub(/\./, ' STOP')
end

#spell_out
  # returns the input string, with characters seperated by dashes
  # converts the input string to lowercase

def spell_out (str)
  str.downcase.split("").join('-')
end

#seperate
  # seperates characters in the input string with a custom seperator, when supplied with one
  # seperates characters in the input string with dashes (by default)

def seperate(str, sep='-')
  str.downcase.split("").join("#{sep}")
end

#croon
  # seperates characters in each word of the input phrase with dashes
  # preserves whitespace between words

def croon(str)
  scnd = []
  str.split(" ").each {|word|
    scnd.push(word.split("").join('-'))
  }
  scnd.join(' ')
end

#palindrome_word?
  # determines whether a single given word is a palindrome
  # ignores case

def palindrome_word?(str)
  str.downcase == str.downcase.reverse
end

#palindrome_sentence?
  # determines whether a given sentence is a palindrome
  # ignores case
  # ignores whitespace
  # ignores punctuation

def palindrome_sentence?(str)
  str.downcase.gsub(/[^a-z]/i, "") == str.downcase.gsub(/[^a-z]/i, "").reverse
end

#is_vowel
  # determines whether a given character is a vowel
  # ignores case
  # returns false for non-letter inputs

def is_vowel(str)
  ['a','e','i','o','u','A','E','I','O','U'].include? str
end

#add_period
  # adds a period to the end of the given sentence
  # does not add a period if one is already there
  # does not add a period if any form of terminal punctuation is present

def add_period(str)
  if ['.','?','!'].include? str[-1]
    str
  else
    str+'.'
  end
end

###########################
#### LOOPS & ITERATORS ####
###########################
#count_spaces
  # counts the spaces in a given string

def count_spaces (word)
  word.count ' '
end

#string_lengths
  # converts a given list of strings to a list of string lengths

def string_lengths (arr)
  return arr.map { |e| e.length }
end

#remove_falsy_values
  # filters out falsy values from the input array

def remove_falsy_values (arr)
  arr.select {|e| !!e }
end

#exclude_last
  # removes the last item from an input array
  # removes the last item from an input string

def exclude_last (arr)
  arr[0...-1]
end

#exclude_first
  # removes the first item from an input array
  # removes the first character from an input string
  # does not alter the original input (non-destructive)

def exclude_first (arr)
  arr[1..-1]
end

#exclude_ends
  # removes the first and last items from an input array
  # removes the first and last characters from an input string

def exclude_ends arr
  arr[1...-1]
end

#select_every_even
  # returns an array of even-indexed items from the input array

def select_every_even arr
  new_arr = []
  0.step(arr.length, 2).each { |s| new_arr.push(arr[s]) if arr[s]}
  new_arr
end

#select_every_odd
  # returns an array of odd-indexed items from the input array
def select_every_odd arr
  new_arr = []
  1.step(arr.length, 2).each { |s| new_arr.push(arr[s]) if arr[s]}
  new_arr
end
#select_every_n
  # returns an array of items at an index evenly divisible by n, from the input array
  # defaults to an n value of 1

def select_every_n (arr, n=1)
  new_arr = []
  0.step(arr.length-1, n).each { |s| new_arr.push(arr[s]) if arr[s]}
  new_arr
end


##############################
#### MANIPULATING NUMBERS ####
##############################
#count_to
  # returns an array containing every integer from 0 to the input n
  # rounds off decimals

def count_to (num)
  if num >= 0
    [*0..num]
  else
    0.downto(num).to_a
  end
end

#is_integer?
  # returns true for Fixnums and Bignums (whole number or 'integer' types)
  # returns true for Floats (decimals) equal to integers
  # returns false for non-integer decimals
  # returns false for Float::NAN
  # returns false for non-numbers

def is_integer?(num)
  num.class == Fixnum || num.class == Bignum ||
  (num.is_a?(Float) && !num.nan? && num == num.to_i)
end

#is_prime?
  # returns false for non-integer decimals
  # returns false for numbers less than or equal to 1
  # returns false for numbers divisible by anything but 1 and themselves
  # returns true for prime numbers

def is_prime? (num)
  return false if num != num.to_i
  return false if num <=1
  Math.sqrt(num).to_i.downto(2).each {|i| return false if num % i == 0}
  true
end

#primes_less_than
  # returns an empty array if there are no primes below num
  # does not return the number itself
  # finds all primes less than the given number

def primes_less_than num
  answer = []
  (num-1).downto(2).each {|n| answer.push(n) if is_prime? n}
  answer.reverse
end

#iterative_factorial
  # returns 1 for 0 and 1
  # returns NaN for numbers less than 0
  # returns NaN for non-integers
  # calculates the factorial of the input number

def iterative_factorial num
  if num < 0 || (num.to_i != num)
    Float::NAN
  elsif num <=1
    return 1
  else
    num.downto(1).inject {|sum, n| sum * n}
  end
end


##############################
#### MANIPULATING OBJECTS ####
##############################
#character_count
  # returns a hash
  # counts how many times each character appears in the input string
  # ignores case

def character_count(str)
  char_count = {}
  str.downcase.each_char { |char|
    num = str.downcase.count char
    char_count[char] = num
  }
  return char_count
end

#word_count
  # returns a hash
  # counts how many times a word appears in the input string
  # ignores case
  # ignores characters that are not in the sequence a-z

def word_count(word)
  word_count = {}
  word.downcase.split.each { |w|
  w_key = w.downcase.gsub(/[^a-z]/i, "")
  if word_count[w_key].nil?
    word_count[w_key] = 1
  else
    word_count[w_key] += 1
  end
  }
  return word_count
end

#most_frequent_word
  # finds the word in the input string that appears with the most frequency

def most_frequent_word (str)
  word_counts = word_count(str)
  # str.split.each { |w|
  # num = str.split.count w
  # word_count[w] = num
  # }
  ans = word_counts.max_by{|k,v| v}
  ans[0]
end
