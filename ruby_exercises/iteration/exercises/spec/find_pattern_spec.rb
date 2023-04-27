RSpec.describe 'find pattern' do

  it 'test 1' do
    ages = [39, 45, 29, 24, 50]
    first_younger_than_thirty = nil
    ages.find do |age|
      if age < 30
        first_younger_than_thirty = age
        break
      end
    end
    expect(first_younger_than_thirty).to eq(29)
  end

  it 'test 2' do
    ages = {
      abdi: 39,
      hassan: 45,
      ladonna: 29,
      margaret: 24,
      miguel: 50
    }
    first_younger_than_thirty = nil
    ages.find do |name, age|
      if age < 30
        first_younger_than_thirty = name
        break
      end
    end
    expect(first_younger_than_thirty).to eq(:ladonna)
  end

  it 'test 3' do
    ages = [39, 45, 29, 24, 50]
    first_older_than_fifty = nil
    ages.find do |age|
      first_older_than_fifty = age if age > 50
    end

    expect(first_older_than_fifty).to be_nil
  end

  it 'test 4' do
    ages = {
      abdi: 39,
      hassan: 45,
      ladonna: 29,
      margaret: 24,
      miguel: 50
    }
    first_older_than_fifty = nil
    ages.find do |name, age|
      first_older_than_fifty = name if age > 50
    end

    expect(first_older_than_fifty).to be_nil
  end

  it 'test 5' do
    ages = [39, 45, 29, 24, 50]
    first_multiple_of_three = nil
    ages.find do |age|
      first_multiple_of_three = age if age % 3 == 0
    end

    expect(first_multiple_of_three).to eq(39)
  end

  it 'test 6' do
    ages = {
      abdi: 39,
      hassan: 45,
      ladonna: 29,
      margaret: 24,
      miguel: 50
    }
    first_multiple_of_three = nil
    ages.find do |name,age|
      first_multiple_of_three = name if age % 3 == 0
    end

    expect(first_multiple_of_three).to eq(:abdi)
  end

  it 'test 7' do
    people = ["Willie", "Carmen Sandiego", "Bryan", "Faith", "Zac"]
    carmen = people.find do |name|
      name.start_with?("Carmen")
    end

    expect(carmen).to eq("Carmen Sandiego")
  end

  it 'test 8' do
    places = {
      Bangkok: "Willie",
      Santa_Fe: "Carmen Sandiego",
      Rome: "Bryan",
      Munich: "Faith",
      Mogudishu: "Zac"
    }
    where_is_carmen_sandiego = {}
    places.find do |place,name|
      where_is_carmen_sandiego = place if name.start_with?("Carmen")
    end

    expect(where_is_carmen_sandiego).to eq(:Santa_Fe)
  end

  it 'test 9' do
    numbers = [3, 7, 13, 11, 10, 2, 17]
    first_even = []
    numbers.find do |number|
      first_even = number if number.even?
    end

    expect(first_even).to eq(10)
  end

  it 'test 10' do
    purchases = {
      "shoes" => :paid,
      "backpack" => :paid,
      "books" => :pending,
      "posters" => :paid,
      "food" => :pending
    }
    first_pending = {}
    purchases.find do |item, status|
      first_pending = item if status == :pending
    end

    expect(first_pending).to eq("books").or eq("food")
  end

  it 'test 11' do
    purchases = {
      "shoes" => :paid,
      "backpack" => :paid,
      "books" => :pending,
      "posters" => :paid,
      "food" => :pending
    }
    starts_with_s = {}
    purchases.find do |item, status|
      starts_with_s = item if item.start_with?("s")
    end

    expect(starts_with_s).to eq("shoes")
  end
end
