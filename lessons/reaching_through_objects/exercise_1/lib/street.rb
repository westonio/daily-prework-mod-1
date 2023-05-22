class Street
  attr_reader :name

  def initialize(name)
    @name = name
    @list_buildings = []
  end

  def buildings
    @list_buildings.map do |building|
      building.building_name
    end.sort
  end

  def add_building(building)
    @list_buildings << building
  end

  def list_available_apartments
    list = {}

    @list_buildings.each do |building|
      available_apts = building.apartments_available
      
      available_apts.map do |apartment|
        apartment_name = "#{building.building_name}: #{apartment.apt_num}"
        rooms = apartment.list_rooms_by_name_alphabetically
        list[apartment_name] = rooms
      end
      
    end
    
    list
  end
end