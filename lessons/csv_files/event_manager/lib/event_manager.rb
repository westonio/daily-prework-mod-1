require "csv"
require './lib/attendee'

contents = CSV.open "./data/event_attendees.csv", headers: true, header_converters: :symbol
attendees = contents.map do |row|
  #(id, first_name, last_name, zipcode)
  attendee = Attendee.new(row[:id], row[:first_name], row[:last_name], row[:zipcode])
  attendee.display
end

p attendees