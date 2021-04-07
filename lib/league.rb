class League

  attr_reader :name,
              :teams
  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

  def captains
    @teams.map do |team|
      team.players.max_by do |player|
        player.salary
      end
    end
  end

  def players_by_team
    names_per_team = @teams.map do |team|
      team.players.map do |player|
        player.name
      end
    end
    detailed = Hash.new({})
    detailed[@teams[0]] = names_per_team[0]
    detailed[@teams[1]] = names_per_team[1]
    detailed
  end

  def most_expensive_player
    captains.max_by do |captain|
      captain.salary
    end.name
  end

  def players_by_salary_range
    
  end
end