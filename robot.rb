class Robot

  require_relative 'commands.rb'
  extend Commands
  
  #initialize robot to center of the table
	def initialize(x_cordinate=2.5, y_cordinate=2.5, direction="north", on_table=false)
		@x_cordinate = x_cordinate
		@y_cordinate = y_cordinate
		@direction = direction
        @on_table = on_table
	end

  #define getter methods for instance variable
  ["x_cordinate", "y_cordinate", "direction", "on_table"].each do |instance_var|
    define_method instance_var.to_sym do
      eval("@#{instance_var}")
    end
  end

  #define setter methods for instance variables
  ["x_cordinate", "y_cordinate", "direction", "on_table"].each do |instance_var|
    self.class_eval("def #{instance_var}=(val);@#{instance_var}=val;end") 
  end

end
 
