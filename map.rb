# frozen_string_literal: true

# Represents a Map object that handles the logic for room placement
class Map
  class OutOfBoundsError < StandardError; end

  def initialize(x, y)
    @storage = Array.new(x) { Array.new(y) }
  end

  def place_room(x, y, room)
    raise OutOfBoundsError unless valid_location?(x, y)

    column = @storage[x]
    column[y] = room

    room
  end

  def get_room(x, y)
    @storage[x][y]
  end

  def neighbors(x, y)
    raise OutOfBoundsError unless valid_location?(x, y)

    neighbors = []

    north = @storage[x][y - 1] if valid_location?(x, y - 1)
    south = @storage[x][y + 1] if valid_location?(x, y + 1)
    west = @storage[x - 1][y] if valid_location?(x - 1, y)
    east = @storage[x + 1][y] if valid_location?(x + 1, y)

    neighbors << { north: north } if north
    neighbors << { south: south } if south
    neighbors << { west: west } if west
    neighbors << { east: east } if east

    neighbors
  end

  private

  # ! indicates it will raise an error
  # ? will return boolean
  def valid_location?(x, y)
    return false if x > @storage.length - 1
    return false if y > @storage.first.length - 1

    true
  end
end
