require_relative 'Disk'

# Represents a peg in the game.
class Peg

  # Hold the disks currently present on the peg.
  # * an array od Disk objects
  attr_accessor :disks

  # The name of the peg.
  # * string
  attr_accessor :name

  # Takes 1 argument - name of the peg.
  # * string
  def initialize(name)
    @disks = []
    @name = name
  end

  # Sets disks on the peg. Used on the starting peg.
  # * disk_count - integer
  def set_disks(disk_count)
    (1..disk_count).each do |disk_count|
      @disks.unshift(Disk.new(disk_count))
    end
  end

  # Moves a disk from peg1 to peg2 or from peg2 to peg1 (whichever is legal).
  # * peg1, peg2 - Peg objects
  def self.move_disk(peg1, peg2)
    if legal_move(peg1, peg2) then
      peg2.disks.push(peg1.disks.last)
      peg1.disks.pop()
    else
      peg1.disks.push(peg2.disks.last)
      peg2.disks.pop()      
    end
  end

  # Checks if it is possible to move a disk from peg1 to peg2.
  # * peg1, peg2 - Peg objects
  def self.legal_move(peg1, peg2)
    return true if peg2.disks.last == nil
    return false if peg1.disks.last == nil
    return peg1.disks.last.size < peg2.disks.last.size
  end
end

