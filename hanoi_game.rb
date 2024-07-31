require_relative 'peg'
require_relative 'ui'

# The main class - responsible for gameplay.
class HanoiGame

  # Creates 3 Peg objects A, B, C and 1 UI object ui as instance variables. Takes the disk count and the visualization speed. Sets the disks on the A peg.
  # * disk_count - integer
  # * visualization_speed - integer
  #   * the greater, the faster
  #   * 0 only shows the final result
  def initialize(disk_count, visualization_speed)
    @A = Peg.new("A")
    @B = Peg.new("B")
    @C = Peg.new("C")
    @A.set_disks(disk_count)
    @disk_count = disk_count
    @visualization_speed = visualization_speed
    @moves = [0]
    @ui = UI.new([@A, @B, @C], disk_count, visualization_speed, @moves)
  end

  # Runs the game. Moves the disks until the ending condition is met. Asks the UI object (created in the constructor) for displaying the game. Return the total number of moves.
  def run
    until check_ending_condition()
      [[@A, @B], [@A, @C], [@B, @C]].each do |peg1, peg2|
        @ui.display() if @visualization_speed > 0
        Peg.move_disk(peg1, peg2)
        @moves[0] += 1
        break if check_ending_condition()
      end
    end
    @ui.display()
    return @moves[0]
  end

  # Checks if the game should end.
  # * returns true or false
  def check_ending_condition
    return (@B.disks.size == @disk_count or @C.disks.size == @disk_count)
  end
end
