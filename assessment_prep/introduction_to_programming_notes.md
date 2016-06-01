# General Prep

## [Ruby Documentation Link] (www.ruby-doc.org "Ruby Documentation") - check out three main areas

1. Class methods (down the side and marked ::)
2. Instance methods (down the side and marked #)
3. Class name (at the top, e.g. "String")

## Intro to Programming Chapters

### The Basics

**Strings, Symbols & Numbers**
* Strings need double inverted commas for string interpolation

**The nil Value**
* Definition of nil: *"a variable with nil is considered to be completely empty and not have any specific type"*
* Check if something is nil using this method `nil?` It returns a boolean value
* Used in a clause/statement, nil will be treated as false due to *truthy* and *falsey* rules
  * Important to note: `nil == false` returns false

**Operations, Type Conversion**
* Examples of operators: `+ - * / % == && ||`
* Examples of type conversion methods: `.to_s .to_i .to_f`

**Data Structures/Collections**

1. Array
  * Ordered via index
  * Example: `arr = [1, 2, 3, 4]`
2. Hash
  * Set of key value pairs
  * Example: `hash = {fname: "Ross", lname: "Jarrett"}`

**Expressions and Return**
* An expression is defined as anything that can be evaluated
* Expressions always return something, even if that is nil


### Variables

**Variable scope**
* Defined as: *"where in a program a variable is available for use"*
* A variable's scope is determined by where initialization took place
* Variable scope is defined by a block
  * Where a variable is initialised inside a block, it is not available outside the block
  * Inner scope can access variables initialized in an outer scope, but not vice versa
  * The reason for the above is that a block creates an inner scope, distinct from the outer scope
  * A block is a block of code, following a method invocation - e.g. `array.each { |block| block }`

**Types of Variables**

1. Constant
  * All caps
  * Informtation extracted to contant variables should not be mutated
  * Must be declared outside of methods
  * Accessible in main scope of program

2. Global
  * Declared with prefix of `$`
  * Override all scope boundaries resulting in accessibility througout the approach
  * Not used readily as they can have unexpected consequences

3. Class
  * Declared with prefix of `@@`
  * Accessible by instances of your class including the class itself
  * Used when you need to create a variable that is related to a class and each instance of the class does not need an individual value for that variable

4. Instance
  * Declared using the prefix `@`
  * Accessible throughout the current instance of the parent class

5. Local
  * Declated simply without prefix
  * Strictly obey all scope boundaries
  * Must important variable to use as a beginner as scope rules will be embedded most readily


### Methods

**General Notes**

* Chunks of code that perform certain tasks
* "what we've done is extracted the logic of printing out text, so that our program can have more flexibility."
* We define parameters into a method when the method requires access to data outside of its scope
* Parameters act as placeholders for the arguments which are "passed" in - these arguments are modified via the code in the method
* The arguments are assigned to the variable (placeholder)

**Default Parameters**

* These are used if we want a parameters to default to something when nothing is passed in
  * We do this: `def method(words='hello')` words is the parameter and 'hello' is the default value

**Mutating the Caller**

* The caller is defined as follows: *whatever the method acts on*
* Some methods mutate the caller, i.e. make a permanent change the argument that is passed - this means it enables a change in the *outer* scope
* Other methods do not make permanent changes
* If we write method that does mutate the caller, we should include a `!` after the method name to remind us
* In general, fluency in this comes from memorizing

**Return**

* Methods implicitely return whatever the last line of the method returns. Hence, we don't always have to explicitely write `return`
  * We should be careful to check what is returned however, as it is sometimes not what we expect - use irb for this

**Chaining Methods**

* Methods can be chained like this `"hi there".length.to_s` - this returns `"8"`
  * A caveat to the above is that nothing must return nil in the chain otherwise it will break down and thorow an error

**Methods as Arguments**

* We can use methods as arguments - whatever value the method returns, is then passed into the method as the argument


### Flow Control

**Conditional flow:** data, doing the right thing when it's supposed to

**Conditionals**

* Generally speaking these are forks which are created using logic, e.g. `if elsif else < > ==`
* Interesting one line if statement syntax `if 'a condition' then 'an outcome' end`
* Also reserved words unless until
* Ternery operator `true ? 'executes this if true' : 'executes this if false'`

**Case Statement**

* These are generally in place of `if elsif else` statements
* However they are more flexible and succinct if used correctly
* For instance, you can do as follows
  * Save the result of a case to a variable
  * Provide an argument to the case or not provide one
* Best way of learning them is to use them in practice and experiement in different situations


### Loops and Iterators

**Loop**

* Typically we will add logic, control flow, conditionals to loops to make them more effective
* `loop` is the most basic of loops, its syntax is as follows:

```ruby
loop do
  'some code'
  break
end
```
* Returns `nil`

* When we create a loop, we must always think of how to break out of the loop
  * For this we can use `break` or `next`
  * We can also assign conditionals to the break clause in one line with `break if` of `break until`

**While and Until Loops**

* While and until loops are given a parameter
* While loops: if the condition returns false, the while loop is broken out of
* Until loops: same as above but simple rephrasing of the problem
* Syntax as follows (sub out while for until where applicable):

```ruby
while 'some condition'
  'some code'
end
```
* Returns `nil`

**Do/while Loop**

* This means that the code is run at least once due to the conditional being placed at the end
* Example use: asking the user if they wish to play again
  * Wrap a whole game in a do/while loop and ask at the end of they wish to play
  * If conditional is met, `break` out of game loop, if not, continue in the loop
* Syntax as follows:

```ruby
loop do
  'some code'
  'some more code'
  'and some more code'    # e.g. gets.chomp
  if 'some condition'     # e.g. that gets.chomp == 'something'
    break
  end
end
```
* Returns `nil`

**For Loop**

* Used to loop over collections, e.g. an array `a = []` or a range `1..10`
* Iteration methods such as `.each` are prefered over for loops
* Syntax as follows:
```ruby
x = [1, 2, 3, 4, 5]

for i in x do
  puts i
end
```
* Returns the original collection
 
**Iterators**

* `.each`
* Iterates over a collection and performs actions on each element depending on what is present in the block
* Return: **original** array
* Syntax as follows:
```ruby
a = [1,2,3,4,5]

# One liner
a.each { |num| p num }

# Multi liner
a.each do |num|
  p num
end
```

* They return values depending on which one is used


### Arrays

**General**

* General definition is: an array is an ordered list of elements whose index begins at 0 and increments by 1
* Creating an array: `arr = [1,2,3,4,5]`
* Two typical array methods: `.first` and `.last`
  * `arr.first` returns the first element
  * `arr.last` returns the last element
  * `arr[3]` returns the element at the third index

**Modifiying Arrays and Common Array Methods**

* `.pop` method
  * This method deletes the last element in the array
  * Destructive method
  * Return: the popped element
```ruby
a = [1,2,3,4,5]
a.pop

# Returns the popped element
```
* `.push` method or `<<` operator
  * This method adds an element to the end of the array
  * Destructive method
  * Return: the modified array, syntax as follows:
```ruby
a = [1,2,3,4,5]

# Push method
a.push 6

# Shovel operator
a << 6

# Returns the new array
```
* `.unshift`
  * Works exactly like `.push` but adds element to the start of the array instead of the end
  * Destructive
  * Return: modified array

* `.map` (`.collect` is an alias) method
  * This method works as follows:
    1. Interates over the array
    2. Applies a block to each element in the array
  * Syntax: same as `.each` method
  * Return: **a new array**
  * Non-destructive method (unless `!` bang operator is used)

* `.delete_at`
  * Used to delete an element at a given index
  * Return: the deleted element
  * Destructive method
  * Syntax:
```ruby
a = [1,2,3,4,5]
a.delete_at(1)

# Deleted item is returned (think of it like .pop method)
```

* `.delete`
  * Works slightly differently as it uses the instance of the element as opposed to indexes
  * It deletes an instance of the element it has passed in as an argument
  * Return: the deleted element
  * Destructive method
  * Syntax: same as delete_at, argument references the element not the index though

* `.uniq`
  * Removes duplicates in an array
  * Non-destructive unless the bang `!` operator is used
  * Syntax: `a.uniq`
  * Returns: the new array

* `.select`
  * Works as follows:
    1. Interates over an array
    2. Returns a new array, continaing only elemtns that return `True` for the conditional
    3. Needs a block to work effectively
  * Non-destructive
  * Syntax: same as `.map` and `.each` etc
  * Return: the new array

* `.include?`
  * Checks to see of the argument given is present in the array
  * Return: boolean
  * Syntax: `array.include?(3)`

* `.flatten`
  * Creates a one dimentional array, thereby removing any nesting
  * Non-destructive (unless `!` is used)
  * Return: a new array
  * If several nests are present this can take an integer as an argument which specifies how many nested levels are flattened
  * Syntax: `array.flatten(1)`

* `.each_index`
  * Syntax: same as `.each`
  * Return: Original array
  * Iterates through the array but the placeholder is the index instead of the element

* `.each_with_index`
  * Return: original array
  * Syntax:
```ruby
a.each_with_index do |val, idx|
  puts "#{idx+1}. #{val}"
end
# In the above, the first placeholder is the element and the second is the index
```

* `.sort`
  * Sorts an array
  * Returns the new array
  * Non-destructive unless `!` is used

* `.product`
  * Combines two arrays
  * Syntax: `array1.product(array2)
  * Each element in array1 is nested with each element of array2
  * Return: a new array


**Nested Arrays**

* Code example below:
```ruby
array = [1, 2, 3, ['a', 'b'], 6]  # index 3 is the nested element ['a', 'b']

# To access an individual element within the nested element we need to reference each nest index:

p array[3][0] # This would print out 'a'
```


### Hashes

**General**

* Hashes are stored values with an associated key (the key is usually a symbol)
* The associated key is what sets hashes apart from arrays

**Retreving Keys/Values From Hashes**

* Given the following hash: `hash = {a:1, b:2, c:3, d:4}`
* To retrieve a value by using a key: `hash[:a]`
* To add to a hash: `hash[:e] = 5`


**Interating Over Hashes**

* Example methods include `.each` or `.select`
  * They be used but we need to include an extra placeholder to account for the keys and values e.g. `hash.each { |key, vakue| code }`

**Hashes vs Arrays**

* When deciding on which data structure to use:
  * Does this data need to be associated with a specific label? If yes, use a hash. If the data doesn't have a natural label, then typically an array will work fine.
  * Do I need a "stack" or a "queue" structure? Arrays are good at mimicking simple "first-in-first-out" queues, or "last-in-first-out" stacks.


**Common Hash Methods**

* `.has_key?`
  * Takes an argument and checks if they given hash contains a key matching the arguement
  * Return: boolean

* `.select`
  * See Array section for funtionality

* `.fetch`
  * Takes an argument and returns the value of a key if a key matches the argument
  * A default value can be used if no match is found

* `.keys` and `.values`
  * Return: keys/values in the given hash - note, the return format is an ARRAY


 