class Apartment
  attr_reader :rooms, :apt_num

  def initialize(apt_num)
    @apt_num = apt_num
    @rented = false
    @rooms = []
    @room_count = 0
  end

  def rented?
    @rented
  end

  def rent
    @rented = true
  end

  def add_room(room)
    if @room_count < 4
      @rooms << room
      @room_count += 1
    else 
      "Error: 4 rooms already exist"
    end
  end

  def list_rooms_by_name_alphabetically
    @rooms.map do |room|
      room.name
    end.sort
  end
end