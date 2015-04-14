require 'spec_helper'

describe Robot do
  
  before :each do
    @robot = Robot.new
  end
  
  describe "robot simulation" do
    
    it "should be instance of Robot" do
      @robot.should be_an_instance_of Robot
    end

    it "should by default place the robot to center of table" do
      @robot.x_cordinate.should be_equal 2.5
      @robot.y_cordinate.should be_equal 2.5
    end

    it "should place robot at any point on the table" do
      Robot.place(@robot, 3, 4, "north")
      @robot.x_cordinate.should be_equal 3
      @robot.y_cordinate.should be_equal 4
      @robot.direction.should eq("north")
    end

    it "should not be allowed to place the robot outside the table" do
      expect { Robot.place(@robot, 6, 7, "north") }.to raise_error(RoboticException, "...Cordinates out of table...")
    end

    it "should not allow move, which take robot outside the table" do
      Robot.place(@robot, 3, 5, "north")
      expect { Robot.move(@robot) }.to raise_error(RoboticException, "...wrong move...")
    end

    it "should move the robot by one unit in the facing direction" do
      Robot.place(@robot, 3, 4, "north")
      Robot.move(@robot)
      @robot.x_cordinate.should be_equal 3
      @robot.y_cordinate.should be_equal 5
      @robot.direction.should eq("north")
    end

    it "should move the robot anticlockwise with left command" do
      Robot.place(@robot, 3, 4, "north")
      Robot.left(@robot)
      @robot.x_cordinate.should be_equal 3
      @robot.y_cordinate.should be_equal 4
      @robot.direction.should eq("west")
    end

    it "should move the robot clockwise with right command" do
      Robot.place(@robot, 3, 4, "north")
      Robot.right(@robot)
      @robot.x_cordinate.should be_equal 3
      @robot.y_cordinate.should be_equal 4
      @robot.direction.should eq("east")
    end

  end
end
