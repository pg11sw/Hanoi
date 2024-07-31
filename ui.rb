# Responsible for the visualization of the game.
class UI
  @@rectangle = [
    "\e[31m\u25AC\e[0m",
    "\e[32m\u25AC\e[0m",
    "\e[33m\u25AC\e[0m",
    "\e[34m\u25AC\e[0m",
    "\e[35m\u25AC\e[0m",
    "\e[36m\u25AC\e[0m",
    "\e[37m\u25AC\e[0m",
    "\e[90m\u25AC\e[0m",
    "\e[91m\u25AC\e[0m",
    "\e[92m\u25AC\e[0m",
    "\e[93m\u25AC\e[0m",
    "\e[94m\u25AC\e[0m",
    "\e[95m\u25AC\e[0m",
    "\e[96m\u25AC\e[0m",
    "\e[97m\u25AC\e[0m"
  ]

  # Takes all the data necessary for displaying the game.
  # * pegs - an array of Peg objects
  # * disk_count - integer
  # * visualization_speed - integer
  #   * the greater, the faster
  #   * 0 only shows the final result
  # * moves - 1-element array holding 1 integer
  def initialize(pegs, disk_count, visualization_speed, moves)
    @pegs = pegs
    @disk_count = disk_count
    @visualization_speed = visualization_speed
    @moves = moves
    @space = " " * (@disk_count)
  end

  # Displays the current state of the game based on the instance variables.
  def display
    if Gem.win_platform?
      system("cls")
    else
      system("clear")
    end

    last = @pegs[0].disks.size
    @pegs.each do |peg|
      last = peg.disks.size if peg.disks.size > last
    end

    (@disk_count-last).times { |x| puts }

    (last-1).downto(0) do |disk_index|

      @pegs.each do |peg|

        disk = peg.disks[disk_index]
        if disk == nil then
          print @space * 2 + " "
        else
          over = disk.size-1
          print " " * (@disk_count-over)
          print "#{@@rectangle[(disk.size-1) % @@rectangle.size]}" * (2*over+1)
          print " " * (@disk_count-over)
        end
      end
      puts
    end
    
    @pegs.each { |peg| print @space + peg.name + @space }
    print @space + @moves.to_s
    puts
    sleep(5.0/@visualization_speed) if @visualization_speed > 0
  end
end