require './lib/ceo'
require './lib/manager'
require './lib/intern'

ali = Ceo.new("Ali", 41235, 15, 20)
ben = Manager.new("Ben", 82735, 10)
chris = Intern.new("Chris", 32145, 5)

require "pry"; binding.pry

# Ali, Ben, and Chris all need names and IDs in the system. Where can they get those?