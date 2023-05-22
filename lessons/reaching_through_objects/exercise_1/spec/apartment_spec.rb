require './lib/apartment'
require './lib/room'

RSpec.describe Apartment do
  before(:each) do
    @apartment = Apartment.new
  end
  it 'exists' do
    expect(@apartment).to be_a(Apartment)
  end

 it 'instantiates not being rented' do
    expect(@apartment.rented?).to eq(false)
 end

 it 'can be rented' do
  @apartment.rent
  expect(@apartment.rented?).to eq(true)
 end

 it 'lists the rooms in the apartment' do
  expect(@apartment.rooms).to eq([])
 end

 it 'can add rooms' do
  room = Room.new('bathroom')
  @apartment.add_room(room)

  expect(@apartment.rooms).to eq([room])
 end

 it 'can have up to 4 rooms' do
  @apartment.add_room(Room.new('bathroom'))
  @apartment.add_room(Room.new("laundry"))
  @apartment.add_room(Room.new("kitchen"))
  @apartment.add_room(Room.new("bedroom"))

  expect(@apartment.rooms.length).to eq(4)
 end

 it 'cannot have more than 4 rooms' do
  @apartment.add_room(Room.new('bathroom'))
  @apartment.add_room(Room.new("laundry"))
  @apartment.add_room(Room.new("kitchen"))
  @apartment.add_room(Room.new("bedroom"))

  room_5 = Room.new('office')
  expect(@apartment.add_room(room_5)).to eq("Error: 4 rooms already exist")
  expect(@apartment.rooms.length).to eq(4)
 end

 it 'can sort list of rooms' do
  @apartment.add_room(Room.new('bathroom'))
  @apartment.add_room(Room.new("laundry"))
  @apartment.add_room(Room.new("kitchen"))
  @apartment.add_room(Room.new("bedroom"))

  expect(@apartment.list_rooms_by_name_alphabetically).to eq(["bathroom", "bedroom", "kitchen", "laundry"])
 end
end