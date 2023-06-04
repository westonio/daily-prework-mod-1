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

  it 'tracks rented boats' do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@sup_1, @eugene)

    expect(@dock.boats_currently_rented).to eq([@kayak_1, @sup_1])
  end

  it 'can only rent boat if not already rented' do
    @dock.rent(@kayak_1, @patrick)

    expect(@dock.rent(@kayak_1, @eugene)).to eq("Already Rented - Please wait for Return")
  end

  it 'can return boats' do
    expect(@dock.return(@kayak_1)).to eq("This boat must be rented first in order to be returned")
    @dock.rent(@kayak_1, @patrick)
    expect(@dock.boats_currently_rented).to eq([@kayak_1])
    
    @dock.return(@kayak_1)
    expect(@dock.boats_currently_rented).to eq([])
  end

  it 'can log an hour for all boats currently rented' do
    @dock.rent(@kayak_1, @patrick)
    expect(@kayak_1.hours_rented).to eq(0)

    @dock.log_hour
    expect(@kayak_1.hours_rented).to eq(1)
    @dock.rent(@sup_1, @eugene)

    @dock.log_hour
    expect(@kayak_1.hours_rented).to eq(2)
    expect(@sup_1.hours_rented).to eq(1)
  end

  it 'can track the revenue for all charges' do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@sup_1, @eugene)

    4.times {@dock.log_hour}
    @dock.charge(@kayak_1, @patrick) # $60 for max 3 hour charge.
    @dock.charge(@sup_1, @eugene) # $45 for max 3 hour charge.

    expect(@dock.revenue).to eq(105)
  end
end