module Commands

  require_relative 'robotic_exception.rb'

  def place(robot, x_cordinate,y_cordinate, direction)

    if x_cordinate.to_i.between?(0,5) && y_cordinate.to_i.between?(0,5)
      robot.x_cordinate = x_cordinate
      robot.y_cordinate = y_cordinate
      robot.direction = direction 
      robot.on_table = true
    else
      raise RoboticException.new("reset cordinates to Place it on table"), "...Cordinates out of table..."
    end
    report(robot)
  end

  def move(robot)
    unless robot.on_table
      raise RoboticException.new("You must enter \"place\" command first to start the robot"), "robot is Inactive"
    end
    case robot.direction.downcase
    when "north"
      robot.y_cordinate = (robot.y_cordinate.to_i >=0 && robot.y_cordinate.to_i < 5) ? robot.y_cordinate.to_i + 1 : (raise RoboticException.new("change direction and move"), "...wrong move...")
    when "south"
      robot.y_cordinate = (robot.y_cordinate.to_i >0 && robot.y_cordinate.to_i <= 5) ? robot.y_cordinate.to_i - 1 : (raise RoboticException.new("change direction and move"), "...wrong move...")
    when "east"
      robot.x_cordinate = (robot.x_cordinate.to_i >=0 && robot.x_cordinate.to_i < 5) ? robot.x_cordinate.to_i + 1 : (raise RoboticException.new("change direction and move"), "...wrong move...")
    else "west"
      robot.x_cordinate = (robot.x_cordinate.to_i >0 && robot.x_cordinate.to_i <= 5) ? robot.x_cordinate.to_i - 1 : (raise RoboticException.new("change direction and move"), "...wrong move...")
    end
    report(robot)
  end

  def left(robot)
    unless robot.on_table
      raise RoboticException.new("You must enter \"place\" command first to start the robot"), "...robot is Inactive..."
    end
    case robot.direction.downcase
    when "north"
      robot.direction = "west"
    when "south"
      robot.direction = "east"
    when "east"
      robot.direction = "north"
    else "west"
      robot.direction = "south"
    end
    report(robot)
  end

  def right(robot)
    unless robot.on_table
      raise RoboticException.new("You must enter \"place\" command first to start the robot"), "robot is Inactive"
    end
    case robot.direction.downcase
    when "north"
      robot.direction = "east"
    when "south"
      robot.direction = "west"
    when "east"
      robot.direction = "south"
    else "west"
      robot.direction = "north"
    end
    report(robot)
  end

  def report(robot)
    unless robot.on_table
      raise RoboticException.new("You must enter \"place\" command first to start the robot"), "robot is Inactive"
    end
    puts "robot is at : #{robot.x_cordinate}, #{robot.y_cordinate}, #{robot.direction}"
  end
  
 
end
