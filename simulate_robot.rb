require_relative 'robot.rb'

VALID_INPUT = ["place", "move", "left", "right", "report", "stop"]
VALID_DIRECTION = ["north", "south", "east", "west"]

def simulate_robot(robot)
  input = gets().chomp
  arg = input.split(/[\s,]+/)
  begin	
    if VALID_INPUT.include?(arg[0].downcase)  
      while arg[0].to_s != "stop"
        if arg.size > 1 || arg[0].to_s == "place"
          if arg.size == 4
            VALID_DIRECTION.include?(arg[3].downcase) ? true : (raise RoboticException.new("use: north, south, east, west"), "...wrong direection...")
			(arg[1].match(/^(\d)+$/) && arg[2].match(/^(\d)+$/)) ? true : (raise RoboticException.new("place cordinate takes only integer value"), "...wrong cordinate...")
            Robot.send(arg[0].downcase.to_sym,robot,arg[1],arg[2],arg[3])
          else
			raise RoboticException.new("place need 3 arguments: X, Y, F"), "...wrong no. of argument for place..."
          end
        else
          Robot.send(arg[0].downcase.to_sym,robot)
        end
        input = gets().chomp
        arg = input.split(/[\s,]+/)
      end
    else
      raise RoboticException.new("Allowed Inputs : \n place X,Y,F ; move ; left ; right ; report"), "...Invalid Inputs..."
    end
  rescue RoboticException => e
    puts e.message
    puts e.error_message
    simulate_robot(robot)
  end
end

#simulating the robot
puts"Enter your command to robot: place X, Y, F ; move ; left ; right ; report; stop"
robot = Robot.new()
simulate_robot(robot)






