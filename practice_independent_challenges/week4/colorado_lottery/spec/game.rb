require './lib/game'

RSpec.describe Game do
  before(:each) do
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  it 'exists' do
    expect(@pick_4).to be_a(Game)
    expect(@mega_millions).to be_a(Game)
  end

  it 'has a name' do
    expect(@pick_4.name).to eq("Pick 4")
    expect(@mega_millions.name).to eq("Mega Millions")
  end

  it 'has a cost' do
    expect(@pick_4.cost).to eq(2)
    expect(@mega_millions.cost).to eq(5)
  end

  it 'is not a national drawing unless indicated' do
    expect(@pick_4.national_drawing?).to eq(false)
    expect(@mega_millions.national_drawing?).to eq(true)
  end
end