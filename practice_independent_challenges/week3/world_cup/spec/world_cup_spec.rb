require './lib/world_cup'
require './lib/team'
require './lib/player'

RSpec.describe Team do
  before(:each) do
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)

    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida) 

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  it 'exists' do
    expect(@world_cup).to be_a(WorldCup)
  end

  it 'has a year' do
    expect(@world_cup.year).to eq(2018)
  end

  it 'has array of teams' do
    expect(@world_cup.teams).to eq([@france, @croatia])
  end

  it 'lists active players by position' do
    active_players = @world_cup.active_players_by_position("midfielder")
    
    expect(active_players).to eq([@pogba, @modric])
  end

  it 'deactivates players when team elminated' do
    @croatia.eliminated = true
    active_players = @world_cup.active_players_by_position("midfielder")

    expect(active_players).to eq([@pogba])
  end

  it 'lists all players by position' do
    all_players = @world_cup.all_players_by_position

    expect(all_players).to eq({"forward"=>[@mbappe], "midfielder"=>[@pogba,@modric], "defender"=>[@vida]})
  end
end