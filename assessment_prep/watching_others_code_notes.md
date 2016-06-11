#Watching Others Code Video Series#

##Video 1##

###Contents:###

* Calculating primes
* Finding sum or product of a series of numbers
* Interleave two arrays

###Calculating primes###

*Part 1*

* Program will work as follows:
  * We will create a method which takes an integer as a parameter
  * When called, this method will return true or false, dependent upon whether the given number is prime
* Basic definition of a prime is any number that can be divided only by 1 and itself
* Brute force way of finding if a number is prime is as follows:
  * Iterate between range of: 2..(number given - 1)
  * Divide number given by each number in the range via the % operator
  * Condition a false return if the % == 0 (else return true)

*Part 2*

* Program will work as follows:
  * Write a method that will take an array of integers and return only those that are prime
  * Use `select` method to iterate through the array
  * Use `prime?` method from part 1 inside the select

*Part 3*

* Write a method that takes an array and counts the number of primes
  * Replace `select` with `count`, leaving the block containing `prime?` method
  * Alternatively write a loop which sums manually


###Finding sum or product of a series of numbers###

* Program works as follows:
  * User is asked to enter a number greater than 0
  * User is asked whether they want to sum the series or product via inputting a letter
  * Program returns the value to the user
  * E.g. number chosen: 5, Sum => 15, Product => 120

###Interleave two arrays###

* Program works as follows:
  * Two arrays are made into one, where one element per array is added to another array
  * E.g. arr1 = [1, 2, 3] arr2 = ['a', 'b', 'c'] new_array = [1, 'a', 2, 'b', 3, 'c']