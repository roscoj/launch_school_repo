#Watching Others Code Video Series#

##Video 1##

###Contents:###

* Calculating primes
* Finding sum or product of a series of numbers
* Interleave two arrays

###Calculating primes###

* Program will work as follows:
  * We will create a method which takes an integer as a parameter
  * When called, this method will return true or false, dependent upon whether the given number is prime
* Basic definition of a prime is any number that can be divided only by 1 and itself
* Brute force way of finding if a number is prime is as follows:
  * Iterate between range of: 2..(number given - 1)
  * Divide number given by each number in the range via the % operator
  * Condition a false return if the % == 0 (else return true)


###Finding sum or product of a series of numbers###