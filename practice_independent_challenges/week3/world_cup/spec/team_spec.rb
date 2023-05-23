require './lib/team'
require './lib/player'

RSpec.describe Team do
  before(:each) do
    @team = Team.new("France")
  end

  it 'exists' do
    expect(@team).to be_a(Team)
  end

  it 'has a country' do
    expect(@team.country).to eq('France')
  end

  it 'started out not eliminated' do
    expect(@team.eliminated?).to eq false
  end

  it 'can be eliminated' do
    @team.eliminated = true

    expect(@team.eliminated?).to eq true
  end

  it 'starts with no players on the team' do
    expect(@team.players).to eq([])
  end

  it 'can add a player to the team' do
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
    @team.add_player(mbappe)
    @team.add_player(pogba)

    expect(@team.players).to eq([mbappe,pogba])
  end

  it 'can list players by position' do
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @team.add_player(mbappe)
    @team.add_player(pogba)
    @team.add_player(modric)

    expect(@team.players_by_position("forward")).to eq([mbappe])
    expect(@team.players_by_position("midfielder")).to eq([pogba, modric])
    expect(@team.players_by_position("defender")).to eq([])
  end
end