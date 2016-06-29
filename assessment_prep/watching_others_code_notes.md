#Watching Others Code Video Series#

##Video 1##

###Contents:###

* Calculating primes
* Finding sum or product of a series of numbers
* Interleave two arrays

###Calculating primes###

**Part 1**

* Program will work as follows:
  * We will create a method which takes an integer as a parameter
  * When called, this method will return true or false, dependent upon whether the given number is prime
* Basic definition of a prime is any number that can be divided only by 1 and itself
* Brute force way of finding if a number is prime is as follows:
  * Iterate between range of: 2..(number given - 1)
  * Divide number given by each number in the range via the % operator
  * Condition a false return if the % == 0 (else return true)

**Part 2**

* Program will work as follows:
  * Write a method that will take an array of integers and return only those that are prime
  * Use `select` method to iterate through the array
  * Use `prime?` method from part 1 inside the select

**Part 3**

* Write a method that takes an array and counts the number of primes
  * Replace `select` with `count`, leaving the block containing `prime?` method
  * Alternatively write a loop which sums manually


###Finding sum or product of a series of numbers###

* Program works as follows:
  * User is asked to enter a number greater than 0
  * User is asked whether they want to sum the series or product via inputting a letter
  * Program returns the value to the user
  * E.g. number chosen: 5, Sum => 15, Product => 120

* Key things to watch out for:
  * When using `gets.chomp`, remember that it returns a string - this causes problems when integers are expected
  * In the block for product, set a reassignment for the product total (`=`) instead of (`+=`)
  * Don't forget to set the result to a variable and output at the end:
```ruby
if operation == 's'
    result = sum(number)
  else
    result = product(number)
  end
```

###Interleave two arrays###

* Program works as follows:
  * Two arrays are made into one, where one element per array is added to another array
  * E.g. arr1 = [1, 2, 3] arr2 = ['a', 'b', 'c'] new_array = [1, 'a', 2, 'b', 3, 'c']
* How to approach:
  * Can use `.zip` method arr1.zip(arr2) => new array
  * Alternatively while loop: `while arr1.size > 0 || arr2 > 0`
  * Block: `new_array << arr1` (and arr 2)
* If odd number of elements in each loop:
  * Nil will be added as an element
  * Delete using `delete(nil)` before returning final result


##Video 2##

###Contents:###

* Calculating substrings
* Find all substrings in a string
* Find longest palindrome in a string

##Calculating substrings##

**Part 1** 

* Program works as follows:
  * Method returns a substring based on specified indicies
  * Method takes parameters
    1. String
    2. Starting index
    3. Ending index

* Things to watch out for:
  * Always think array when indicies are involved - use `.split("")` or `.chars`
  * Default parameter `def method(param1, param2 = "something")`
  * Calculate a range using the index inputs
  * `.each_with_index` is good as you can associate letters *and* their respective indices
  * `if range.include?(idx)`
  * `<<` the relevent letters into a new array and join

**Part 2**

* Write a method that returns all substrings from a string
* E.g. substring("band") => "ba" "ban" "band" "an" "and" "nd"



##Video 4##

###Contents###

* Capitalize words 6:30 to complete / 27 mins to complete without using the capitalize method
* Calculate number of Friday the 13ths in a year
* Generate random English mathematical phrases

