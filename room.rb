# frozen_string_literal: true

# Represents a Room object that has a name, description, and neighbors
class Room
  def initialize(name, description)
    raise ArgumentError unless name
    raise ArgumentError unless description

    @name = name
    @description = description
  end

  attr_accessor :map

  def describe
    "#{@name} - #{@description}"
  end

  def neighbors
    map.neighbors.reduce Hash.new, :merge
  end
end
