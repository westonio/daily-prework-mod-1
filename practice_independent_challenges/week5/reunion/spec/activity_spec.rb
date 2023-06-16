require './lib/activity'

RSpec.describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  it 'exists' do
    expect(@activity).to be_a(Activity)
  end

  it 'has a name' do
    expect(@activity.name).to eq("Brunch")
  end

  it 'can add and list participants' do
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
  end

  it 'can track total cost' do
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    expect(@activity.total_cost).to eq(60)
  end

  it 'can split the bill equally among participants' do
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    expect(@activity.split).to eq(30)
  end

  it 'can list how much is owed to each participant' do
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    @activity.split
    expect(@activity.owed).to eq({"Maria"=>10.0, "Luther"=>-10.0})
  end
end