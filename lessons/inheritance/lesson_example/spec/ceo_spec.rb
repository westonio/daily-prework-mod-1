require './lib/ceo'

RSpec.describe Ceo do
  before(:each) do
    @ceo = Ceo.new("Jeff", 1234, 15, 20)
  end

  describe "setup" do
    it "exists" do
      expect(@ceo).to be_a(Employee)
      expect(@ceo).to be_a(Ceo)
    end

    it "has base_salary and bonus attributes" do
      expect(@ceo.base_salary).to eq(15)
      expect(@ceo.bonus).to eq(20)
    end
  end

  describe "Has a name, ID, and total_compensation" do
    # Write tests to prove that a Ceo instance can have a Name and ID number, like any other Employee.
    it 'has a name and ID' do
      expect(@ceo.name).to eq("Jeff")
      expect(@ceo.id).to eq(1234)
    end
    # Also, the CEO should be able to receive a total compensation. Write at least one test that proves they can access this method.
    it 'uses parent total comp method' do
      expect(@ceo.total_compensation).to eq(35)
    end
  end
end