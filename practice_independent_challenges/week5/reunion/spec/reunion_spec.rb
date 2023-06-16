require './lib/reunion'
require './lib/activity'

RSpec.describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Trivia")
  end

  it 'exists' do
    expect(@reunion).to be_a(Reunion)
  end

  it 'has a name' do
    expect(@reunion.name).to eq("1406 BE")
  end

  it 'can add and list activities' do
    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)

    expect(@reunion.activities).to eq([@activity_1, @activity_2])
  end
end