require './lib/colorado_lottery'
require './lib/contestant'
require './lib/game'

RSpec.describe ColoradoLottery do
  before(:each) do
    @lottery = ColoradoLottery.new
    #games
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    #contestants
    @alexander = Contestant.new({
      first_name: 'Alexander',
      last_name: 'Aigades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})
    @benjamin = Contestant.new({
      first_name: 'Benjamin',
      last_name: 'Franklin',
      age: 17,
      state_of_residence: 'PA',
      spending_money: 100})
    @frederick = Contestant.new({
      first_name:  'Frederick',
      last_name: 'Douglass',
      age: 55,
      state_of_residence: 'NY',
      spending_money: 20})
    @winston = Contestant.new({
      first_name: 'Winston',
      last_name: 'Churchill',
      age: 18,
      state_of_residence: 'CO',
      spending_money: 5})
  end

  it 'exists' do
    expect(@lottery).to be_a(ColoradoLottery)
  end

  it 'starts with no registered contestants, current contestants or winners' do
    expect(@lottery.registered_contestants).to be_empty
    expect(@lottery.winners).to be_empty
    expect(@lottery.current_contestants).to be_empty
  end

  it 'can determine if interested and 18 or older' do
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')

    expect(@lottery.interested_and_18?(@alexander, @pick_4)).to be true
    expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to be false
    expect(@lottery.interested_and_18?(@alexander, @cash_5)).to be false
  end

  it 'can determin if contestant can register' do
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @frederick.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')

    expect(@lottery.can_register?(@alexander, @pick_4)).to be true
    expect(@lottery.can_register?(@alexander, @cash_5)).to be false
    expect(@lottery.can_register?(@frederick, @mega_millions)).to be true
    expect(@lottery.can_register?(@benjamin, @mega_millions)).to be false
    expect(@lottery.can_register?(@frederick, @cash_5)).to be false
  end
end