class RoboticException < StandardError

  def initialize(error_message)
    @error_message = error_message
  end

  #define getter methods for instance variable
  ["error_message"].each do |instance_var|
    define_method instance_var.to_sym do
      eval("@#{instance_var}")
    end
  end

  #define setter methods for instance variables
  ["error_message"].each do |instance_var|
    self.class_eval("def #{instance_var}=(val);@#{instance_var}=val;end") 
  end

end
