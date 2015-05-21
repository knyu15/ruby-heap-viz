require_relative 'sys-utils'

module ReplUtils  
  def example!
    #Demonstrate object creation and referencing by a variable
    @greeting = Example::String.new("Hello")
    #Demonstrate two variables referencing the same object
    @english_greeting = @greeting
    #Demonstrate object references
    @greetings = Example::Array.new
    @greetings << @greeting
    #Demonstrate object references to an "un-named" object
    @greetings << Example::String.new("Hola")
    #Demonstrate an orphaned object
    #Force ruby's garbage collection with GC.start to watch it disappear!
    Example::String.new("Hard knock life")
    nil
  end

  def reset!
    instance_variables.each {|v| remove_instance_variable(v)}
    GC.start
  end

  def viz!
    puts 'The `open` executable cannot be found in your PATH or `open` command is '\
         'not available for you current system, sorry. Please open viz.html directly '\
         'in your browser.' unless SysUtils::open('viz.html')
  end

  def graph_report
    ObjectSpace.each_object do |obj|
      next if obj.object_id == self.object_id
      ObjectSpace.reachable_objects_from(obj).each do |ref|
        if ref.class.to_s.start_with?(ObjectNode::NAMESPACE.to_s)
          puts "#{obj.class}##{obj.object_id} retains a reference to #{ref.class}##{ref.object_id}"
        end
      end
    end
    nil
  end
end