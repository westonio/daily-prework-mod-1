require './lib/player'

RSpec.describe Player do
  before(:each) do
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  it 'exists' do
    expect(@player).to be_a(Player)
  end

  it 'has info' do
    expect(@player.info).to be_a(Hash)
    expect(@player.info).to eq({name: "Luka Modric", position: "midfielder"})
  end

  it 'has a name' do
    expect(@player.info[:name]).to eq("Luka Modric")
  end

  it 'has a position' do
    expect(@player.info[:position]).to eq("midfielder")
  end
end