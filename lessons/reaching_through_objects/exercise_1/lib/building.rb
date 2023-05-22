class Building
  attr_reader :building_number, :building_name, :list_apartments

  def initialize(building_number, building_name)
    @building_number = building_number
    @building_name = building_name
    @list_apartments = []
  end

  def add_apartment(apartment)
    @list_apartments << apartment
  end

  def apartments_available
    @list_apartments.select do |apartment|
      apartment.rented? == false
    end
  end
end