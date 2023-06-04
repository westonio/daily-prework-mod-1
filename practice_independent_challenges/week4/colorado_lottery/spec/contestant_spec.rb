require './lib/contestant'

RSpec.describe Contestant do
  before(:each) do
    @alexander = Contestant.new({first_name: 'Alexander',
      last_name: 'Aigiades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})
  end

  it 'exists' do
    expect(@alexander).to be_a Contestant
  end

  it 'has a full name' do
    expect(@alexander.full_name).to eq('Alexander Aigiades')
  end

  it 'has an age' do
    expect(@alexander.age).to eq 28
  end

  it 'has a state of residence' do
    expect(@alexander.state_of_residence).to eq('CO')
  end

  it 'has spending money amount' do
    expect(@alexander.spending_money).to eq 10
  end

  it 'is not out of state by default' do
    expect(@alexander.out_of_state?).to eq(false)
  end

  it 'has no game interests to start, and can add game interests' do
    expect(@alexander.game_interests).to eq([])
    @alexander.add_game_interest('Mega Millions')
    @alexander.add_game_interest('Pick 4')

    expect(@alexander.game_interests).to eq(['Mega Millions', 'Pick 4'])

  end
end