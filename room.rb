class Room
  def initialize(name, description)
    raise ArgumentError unless name
    raise ArgumentError unless description

    @name = name
    @description = description
  end

  def describe
    "#{@name} - #{@description}"
  end

  def neighbors
    {}
  end
end
