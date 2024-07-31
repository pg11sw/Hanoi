# Represents a disk.
class Disk

  # Describes the size of the disk. A greater size means a wider disk. NOTE: It is not the same as the size visible on the terminal.
  # * integer
  attr_accessor :size

  # Takes size of the disk.
  # * size - integer
  def initialize(size)
    @size = size
  end
end
