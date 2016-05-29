# General Prep

## [Ruby Documentation Link] (www.ruby-doc.org "Ruby Documentation") - check out three main areas
1. Class methods (down the side and marked ::)
2. Instance methods (down the side and marked #)
3. Class name (at the top, e.g. "String")

## Intro to Programming Chapters
### The Basics
**Strings, Symbols & Numbers**
* Strings need double inverted commas for string interpolation

**nil**
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
  * 

4. Instance
  * 

5. Local
  * 