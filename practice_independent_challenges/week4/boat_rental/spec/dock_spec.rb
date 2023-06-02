require './lib/dock'
require './lib/boat'
require './lib/renter'

RSpec.describe Dock do
  before(:each) do
    @dock = Dock.new("The Rowing Dock", 3)

    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)

    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")    
  end

  it 'exists' do
    expect(@dock).to be_a Dock
  end

  it 'has a name' do
    expect(@dock.name).to eq "The Rowing Dock"
  end

  it 'has a time limit' do
    expect(@dock.max_rental_time).to eq 3
  end

  it 'can rent boats to renters and log it' do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)

    expected = {@kayak_1 => @patrick, @kayak_2 => @patrick, @sup_1 => @eugene}
    expect(@dock.rental_log).to eq(expected)
  end

  it 'can charge for the boat rental' do
    @dock.rent(@kayak_1, @patrick)
    @kayak_1.add_hour
    @kayak_1.add_hour

    expected = {:card_number => @patrick.credit_card_number, :amount => 40}

    expect(@dock.charge(@kayak_1,@patrick)).to eq(expected)
  end

  it 'can only charge up to max rental time(3 for @dock)' do
    @dock.rent(@kayak_1, @patrick)
    @kayak_1.add_hour
    @kayak_1.add_hour
    @kayak_1.add_hour
    @kayak_1.add_hour
    
    expected_charge = {:card_number => @patrick.credit_card_number, :amount => 60}
    expect(@kayak_1.hours_rented).to eq(4)
    expect(@dock.charge(@kayak_1,@patrick)).to eq(expected_charge)
  end
end