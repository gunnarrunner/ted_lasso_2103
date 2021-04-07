class Player

  attr_reader :name,
              :position,
              :salary
  def initialize(attributes)
    @name = attributes[:name]
    @position = attributes[:position]
    @salary = attributes[:salary]
  end
end