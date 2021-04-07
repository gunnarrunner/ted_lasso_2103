require './lib/player'
require './lib/team'
require './lib/league'


RSpec.describe League do
  it 'exists' do
    premier = League.new("Premier League")

    expect(premier).to be_instance_of(League)
  end

  it "can have attributes" do
    premier = League.new("Premier League")
    
    expect(premier.name).to eq("Premier League")
    expect(premier.teams).to eq([])
  end

  it 'can add teams to the league' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.teams).to eq([richmond, manchester])
  end

  it 'can determine the captains of each team' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)
    
    expect(premier.captains).to eq([roy, fernandinho])
  end

  it 'can categorize players by team' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)
    organized_team = {
                      richmond => ["Roy Kent", "Sam Obisanya"],
                      manchester => ["Jamie Tartt", "Fernandinho"]
    }

    expect(premier.players_by_team).to eq(organized_team)
  end

  it 'can determine the most expensive player' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)

    expect(premier.most_expensive_player).to eq("Fernandinho")
  end

  it 'can determine players salary by range' do
    premier = League.new("Premier League")
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
    sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
    jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
    manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

    premier.add_team(richmond)
    premier.add_team(manchester)
    salary_range = {
                    "Over 0M" => ["Sam Obisanya"],
                    "Over 1M" => ["Roy Kent", "Jamie Tartt"],
                    "Over 2M" => [],
                    "Over 3M" => [],
                    "Over 4M" => [],
                    "Over 5M" => ["Fernandinho"],
    }
    expect(premier.players_by_salary_range).to eq(salary_range)
  end
end