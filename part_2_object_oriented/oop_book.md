#Object Oriented Programming Book#

##Introduction##

OOP was brought forth as a paragigm, to enable programmers to handle large programs; such programs,
if not written in an OOP style, are difficult or impossible to maintain - this is mainly due to the dependencies,
where a ripple effect can crash the whole program.

**Some definitions**

* Encapsulation: the act of hiding parts of the program so that the data contained cannot be modified without intent. It
is a form of data protection in this sense
* Polymorphism: 'poly' (many) and 'morph' (form). The ability of data to be represented as many different types
* Inheritance: An idea that a class can inherit behaviours of another class; a *superclass*



**What are objects? / Classes define objects**

Everything is an object! Objects are created from classes. For example `"Hello"` is an object created from the *string* class. Think
of classes as molds which create the objects. Classes are included in a program using the reserve word `class` and named using CamelCase.

The workflow of creating objects out of classes is called *instantiation*:
  "We have instantiated the object from the class"
  
  
**Modules**

These are mixed in with classes using the reserve word `include` which is known as a *mixin*. However they are first added to our overall
program before this is possible.


**Introduction Exercises**

1. How do we create an object in Ruby? Give an example of the creation of an object. 
```ruby
class SpeakSlowly
end

an_object = SpeakSlowly.new

```

2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

```ruby
module my_module
end

class MyClass
  include my_module
end

new_object = MyClass.new
```

##Classes and Objects - Part I##

**General notes:**

* `attr_accessor`, `attr_reader` and `attr_writer` are *methods*
* This is key to understanding how they work; when we change parameters using them we remove the `@` and instead of calling the variable directly, we call the methods
* They are known as "getter and setter methods"
* Syntax as follows:
```ruby
class = SomeClass
attr_accessor :some_param

end
```

