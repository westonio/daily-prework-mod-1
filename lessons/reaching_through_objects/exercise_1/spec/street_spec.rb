require './lib/street'
require './lib/building'
require './lib/apartment'
require './lib/room'

RSpec.describe Street do
  before(:each) do
    @street = Street.new("Adlington Road")
  end

  it 'exists' do
    expect(@street).to be_a(Street)
  end

  it 'has a street name' do
    expect(@street.name).to eq("Adlington Road")
  end

  it 'has a list of buildings on the street' do
    expect(@street.buildings).to eq([])
  end

  it 'can add buildings to the list' do
    bldg = Building.new("623", "Savills Apartment Building") 

    @street.add_building(bldg)
    expect(@street.buildings.length).to eq(1)
    expect(@street.buildings).to eq([bldg.building_name])
  end

  it 'sorts buildings by name' do
    savills = Building.new("623", "Savills Apartment Building")
    zebra = Building.new("123", "Zebra Apartments")

    @street.add_building(zebra)
    @street.add_building(savills)

    expect(@street.buildings).to eq(["Savills Apartment Building", "Zebra Apartments"])
  end

  it 'can state the number of apartments not currently rented' do
  #setup
    savills = Building.new("623", "Savills Apartment Building")
      apt_1 = Apartment.new(103)
        apt_1.add_room(Room.new("bathroom"))
        apt_1.add_room(Room.new("bedroom"))
      apt_1.rent
      apt_2 = Apartment.new(215)
        apt_2.add_room(Room.new("kitchen"))
        apt_2.add_room(Room.new("office"))
        apt_2.add_room(Room.new("bedroom"))
      savills.add_apartment(apt_1)
      savills.add_apartment(apt_2)
    zebra = Building.new("123", "Zebra Apartments")
      apt_3 = Apartment.new(724)
        apt_3.add_room(Room.new("laundry"))
        apt_3.add_room(Room.new("studio"))
      zebra.add_apartment(apt_3)

    @street.add_building(zebra)
    @street.add_building(savills)

    expect(@street.list_available_apartments).to eq({"Savills Apartment Building: 215"=>["bedroom", "kitchen", "office"], "Zebra Apartments: 724"=>["laundry", "studio"]})
  end
end