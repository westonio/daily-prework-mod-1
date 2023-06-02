require "csv"

contents = CSV.open "./data/event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zip(row[:zipcode])
  puts "#{name} #{zipcode}"
end

#if the zipcode is 5 digits assume it is okay
#if the zipcode is less than 5 digits, assume it is missing leading zeros
#if the zipcode is more than 5 digits, truncate it
#if the zipcode is missing, enter filler 00000