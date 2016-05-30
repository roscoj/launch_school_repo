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

