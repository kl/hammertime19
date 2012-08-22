#hammertime19

An interactive error console similar to those found in Lisp and Smalltalk environments.

hammertime19 is a fork of Avid Grimm's hammertime gem: https://github.com/avdi/hammertime

hammertime19 is a Ruby 1.9.2+ (MRI and RBX) only version that adds support for starting a pry (https://github.com/pry/pry)
session at the exception raise site.

hammertime19 also adds basic support for intercepting C-level based exceptions.

##Install

gem install hammertime19

##Synopsis

Simply require the Hammertime library:

```ruby
require 'hammertime19'

$broken = true

def faulty_method
  raise "Oh no!" if $broken
end

3.times do |n|
  puts "Attempt (#{n+1}/3)"
  begin
    faulty_method
    puts "No error raised"
  rescue => error
    puts "Error raised: #{error.inspect}"
  end
end
```

When an error is raised, a menu of possible actions will be presented at the console:

```
=== Stop! Hammertime. ===
An error has occurred at example.rb:4:in `raise_runtime_error'
The error is: #<RuntimeError: Oh no!>
1. Continue (process the exception normally)
2. Ignore (proceed without raising an exception)
3. Permit by type (don't ask about future errors of this type)
4. Permit by line (don't ask about future errors raised from this point)
5. Backtrace (show the call stack leading up to the error)
6. Debug (start a debugger)
7. Console (start a pry session)
What now?
```

This enables a fix-and-continue style of development:

```
$ ruby example.rb                                                
Attempt (1/3)

=== Stop! Hammertime. ===
An error has occurred at example.rb:6:in `faulty_method'
The error is: #<RuntimeError: Oh no!>                   
1. Continue (process the exception normally)            
2. Ignore (proceed without raising an exception)        
3. Permit by type (don't ask about future errors of this type)
4. Permit by line (don't ask about future errors raised from this point)
5. Backtrace (show the call stack leading up to the error)              
6. Debug (start a debugger)                                             
7. Console (start a pry session)                                       
What now?
7

From: test.rb @ line 5 Object#faulty_method:

    5: def faulty_method
 => 6:   raise "Oh no!" if $broken
    7: end

[1] pry(main)> $broken = false
=> false
[2] pry(main)> exit

1. Continue (process the exception normally)
2. Ignore (proceed without raising an exception)
3. Permit by type (don't ask about future errors of this type)
4. Permit by line (don't ask about future errors raised from this point)
5. Backtrace (show the call stack leading up to the error)
6. Debug (start a debugger)
7. Console (start a pry session)
What now?
2
No error raised
Attempt (2/3)
No error raised
Attempt (3/3)
No error raised
```

####About non-explicitly raised errors:
    
An example of a non-explicitly raised error is if you divide by 0 which creates a
ZeroDivisionError.
Hammertime19 cannot process these errors in the same way as user raised errors can be processed.
However, they can be intercepted, and a pry session can be started at the exception site.

For example running this code:

```ruby
require 'hammertime19'
1 / 0
```

Gives you a pry console like this:

```
=== Stop! Hammertime. ===
A C-level error has occurred at h.rb:2:in `/'
The error is: <ZeroDivisionError> divided by 0

From: h.rb @ line 2 :

    1: require 'hammertime19.'
 => 2: 1 / 0

[1] pry(main)>
```

These types of errors cannot be recovered from, so when the pry session ends the program exits.

Hammertime19 doesn't know if the exception will be rescued, so therefore all exceptions that
are not explicitly raised will be intercepted in this way.

If you find that annoying, you can turn of this feature by calling:

```ruby
Hammertime.intercept_native = false
```

##Known Bugs

* Hammertime19 cannot recover from errors that are raised from native code.
* Hammertime19 cannot distinguish between native code exceptions that will be rescued and those that won't.

##TODO

* Tests

##Dependencies

* pry (https://github.com/pry/pry)
* binding_of_caller (https://github.com/banister/binding_of_caller)

##Copyright

Copyright (c) 2010 Avdi Grimm. See LICENSE for details.
