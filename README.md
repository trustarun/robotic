Project Description:
*********************
This project goal is to build a robot simulator app using ruby.
The robot behaviour to be simulated is present in docs/Locomote-Ruby-Code-Test.pdf file.

______________________________________________________________________________________

Dependency:
*************
1 => ruby with version >= 1.9.3
2 => system should have bundler gem installed to manage the gem dependency
3 => rspec gems

NOTE: dependency 2 and 3 is for runing Rspec test cases.They are not needed for simulating the robot.
_______________________________________________________________________________________

Setting Up Environment:
************************
Step 1: move to project directory

        $ cd robotic

Step 2: Install the Gem with below command
        
        $ bundle install

________________________________________________________________________________________

Running Test Cases:
*********************
Step 1: move to project directory

        $ cd robotic

Step 2: run the test cases with below command
        
        $ rspec spec/robotic.rb

_________________________________________________________________________________________


Simulating Robot from terminal
*******************************

Step 1: Downlaod the App, unzip it and move to the robotic folder
		 $ cd robotic

Step 2: Check that, your system have ruby installed
		$ ruby -v
		ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-darwin14.0]

        NOTE: If the above command not return any ruby, install it on your system

Step 3: know the basic commands
        You can use below commands to play with the robot:

        place x,Y,F => It will start the game by placing the robot at the specified position.
		move        => will move the robot by one unit in its facing direction
        left        => will turn the robot by 90 degree anticlockwise
        right       => will turn the robot by 90 degree clockwise
        report      => see the current position of robot at any time
        stop        => exit out of the game

        NOTE: You can type these commands in any sequence with the condition that place is the first command.
              You will be warned for any wrong sequence of move

Step 3: Run the app with below command
		$ ruby simulate_robot.rb

        Note: keep writing the command and press enter for output


