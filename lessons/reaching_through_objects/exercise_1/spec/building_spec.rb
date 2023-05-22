require './lib/building'
require './lib/apartment'
require './lib/room'

RSpec.describe Building do
  before(:each) do
    @bldg = Building.new("623", "Savills Apartment Building") 
  end
  
  it 'exists' do
    expect(@bldg).to be_a(Building)
  end

  it 'has a building number' do
    expect(@bldg.building_number).to eq("623")
  end

  it 'has a name' do
    expect(@bldg.building_name).to eq("Savills Apartment Building")
  end

  it 'has a list of apartments' do
    expect(@bldg.list_apartments).to be_empty

    apt_1 = Apartment.new
    apt_2 = Apartment.new
    apt_5 = Apartment.new

    @bldg.add_apartment(apt_1)
    @bldg.add_apartment(apt_2)
    @bldg.add_apartment(apt_5)

    expect(@bldg.list_apartments).to eq([apt_1, apt_2, apt_5])
  end

  it 'can list apartments not rented' do
    apt_1 = Apartment.new
    apt_2 = Apartment.new
    apt_5 = Apartment.new

    @bldg.add_apartment(apt_1)
    @bldg.add_apartment(apt_2)
    @bldg.add_apartment(apt_5)

    apt_2.rent
    
    expect(@bldg.apartments_available).to eq([apt_1, apt_5])
  end
end