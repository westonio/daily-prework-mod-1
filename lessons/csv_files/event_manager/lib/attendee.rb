class Attendee
  attr_reader :id, :name, :zipcode

  def initialize(id, first_name, last_name, zipcode)
    @id = id
    @name = "#{first_name} #{last_name}"
    @zipcode = clean_zip(zipcode)
  end

  def display
    "#{id}: #{@name}, #{@zipcode}"
  end

  def clean_zip(zip)
    zip.to_s.rjust(5,"0")[0..4]
  end
end