#Heap Viz

An interactive Ruby Heap Visualization

##Usage

Start the heap viz REPL with `ruby heap-console.rb`. This will kick off a separate process for the websocket server, and start a thread locally that will periodically push the state of the heap to all websocket clients.

Open `viz/index.html` to see the heap visualization.

Two utility functions are available to you in the repl:

 * `example!` - creates three example objects
 * `reset!` - unsets all instance variables and starts GC. This will not cleanup objects referenced by local variables.

Currently the heap state code requires you to use classes under a specific namespace. Two classes are available, `Example::String` and `Example::Array`. They behave just like `String` and `Array`. You can add your own classes under the namspace too!

It's suggested that you use instance variables at the REPL. Local variables (due to scope constraints) will neither show up in the variable table nor will they be cleared in a `reset!`.

Example:

```
Heap Console Ready.
> @greeting = Example::String.new("Hello")
=> #<Example::String:0x007fbf7a1d9430 @string="Hello">
```

##Cool Examples

Here are some examples to consider:

 * Create an array and two objects, push those objects into the array to demonstrate references between objects
 * Duplicate an array like the one above to demonstrate object duplication, as well as the fact that `#dup` is a "shallow copy"
 * Add an object to an array, but do not assign a variable name to that object. This shows that objects can be in the object graph even if they're unnamed
 * Create an orphaned object (e.g. add a string to an array, then `#pop` it) and call `GC.start` to demonstrate garbage collection

