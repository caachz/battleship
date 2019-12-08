class Cell

  attr_reader :coordinate, :fired_upon
  attr_accessor :ship, :show_ships

  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
    @has_ship = false
    @show_ships = false
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    return true if @ship == nil
    false
  end

  def fire_upon
    if !empty?
      @ship.health -= 1
    end
    @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end

  def render(*add_ship)
    if @ship != nil
      @has_ship = true
    end
    
    return "X" if @has_ship == true && @ship.health == 0
    return "H" if @fired_upon == true && @has_ship == true
    return "M" if @fired_upon == true && @has_ship == false

    if @show_ships == true || add_ship[0] == true
      return "S" if @fired_upon == false && @has_ship == true
    end
    "."

  end
end
