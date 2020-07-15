class Map
  class OutOfBoundsError < StandardError; end

  def initialize(x, y)
    @storage = Array.new(x, Array.new(y))
  end

  def place_room(x, y, room)
    # TODO: might be off by one
    raise OutOfBoundsError if x > @storage.length
    raise OutOfBoundsError if y > @storage.first.length

    @storage[x][y] = room
  end

  def get_room(x, y)
    @storage[x][y]
  end

  def neighbors(x, y)
    neighbors = []

    neighbors << neighbor(x, y, :north)
    neighbors << neighbor(x, y, :south)
    neighbors << neighbor(x, y, :east)
    neighbors << neighbor(x, y, :west)

    neighbors
  end

  private

  def neighbor(x, y, direction)
    case direction
    when :north
      @storage[x, y - 1]
    when :south
      @storage[x, y + 1]
    when :east
      @storage[x + 1, y]
    when :west
      @storage[x - 1, y]
    end
  end
end
