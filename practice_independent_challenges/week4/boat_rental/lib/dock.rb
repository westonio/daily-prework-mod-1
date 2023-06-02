class Dock
  attr_reader :name, 
              :max_rental_time,
              :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    rental_log[boat] = renter
  end

  def charge(boat, renter)
    hours = get_hours(boat)
    amount = (hours * boat.price_per_hour)
    {:card_number => renter.credit_card_number, :amount => amount}
  end

  def get_hours(boat)
    boat.hours_rented < @max_rental_time ? boat.hours_rented : @max_rental_time
  end

end