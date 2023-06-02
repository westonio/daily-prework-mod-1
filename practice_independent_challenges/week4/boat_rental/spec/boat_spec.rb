require './lib/boat'

RSpec.describe Boat do
  before(:each) do
    @kayak = Boat.new(:kayak, 20)
  end

  it 'exists' do
    expect(@kayak).to be_a Boat
  end

  it 'has a boat type' do
    expect(@kayak.type).to eq :kayak
  end

  it 'has hourly rate' do
    expect(@kayak.price_per_hour).to eq 20
  end

  it 'starts with zero hours reted by default' do
    expect(@kayak.hours_rented).to eq 0
  end

  it 'can have rented hours added' do
    @kayak.add_hour
    @kayak.add_hour
    @kayak.add_hour

    expect(@kayak.hours_rented).to eq 3
  end
end