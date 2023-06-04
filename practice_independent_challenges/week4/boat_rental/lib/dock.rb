class Dock
  attr_reader :name, 
              :max_rental_time,
              :rental_log,
              :boats_currently_rented,
              :revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @boats_currently_rented = []
    @revenue = 0
  end

  def rent(boat, renter)
    if @boats_currently_rented.include?(boat)
      "Already Rented - Please wait for Return"
    else
      rental_log[boat] = renter
      @boats_currently_rented << boat
    end
  end

  def return(boat)
    if @boats_currently_rented.include?(boat)
      @boats_currently_rented.delete(boat)
    else
      "This boat must be rented first in order to be returned"
    end
  end

  def charge(boat, renter)
    hours = get_hours(boat)
    amount = (hours * boat.price_per_hour)
    @revenue += amount
    {:card_number => renter.credit_card_number, :amount => amount}
  end

  def get_hours(boat)
    boat.hours_rented < @max_rental_time ? boat.hours_rented : @max_rental_time
  end

  def log_hour
    @boats_currently_rented.each do |boat|
      boat.add_hour
    end
  end

end