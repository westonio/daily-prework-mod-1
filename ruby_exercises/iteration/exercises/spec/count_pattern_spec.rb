RSpec.describe 'count pattern' do

  it 'test 1' do
    ages = [39, 45, 29, 24, 50]
    younger_than_thirty = 0
    ages.count do |age|
      if age < 30
        younger_than_thirty += 1
      end
    end
    expect(younger_than_thirty).to eq(2)
  end

  it 'test 2' do
    ages = {
      abdi: 39,
      hassan: 45,
      ladonna: 29,
      margaret: 24,
      miguel: 50
    }
    younger_than_thirty = 0
    ages.count do |name, age|
      if age < 30
        younger_than_thirty += 1
      end
    end
    expect(younger_than_thirty).to eq(2)
  end

  it 'test 3' do
    ages = [39, 45, 29, 24, 51]
    older_than_fifty = 0
    ages.count do |age|
      older_than_fifty += 1 if age > 50
    end

    expect(older_than_fifty).to eq(1)
  end

  it 'test 4' do
    ages = {
      abdi: 39,
      hassan: 45,
      ladonna: 73,
      margaret: 51,
      miguel: 50
    }
    older_than_fifty = 0
    ages.count do |name, age|
      older_than_fifty += 1 if age > 50
    end

    expect(older_than_fifty).to eq(2)
  end

  it 'test 5' do
    ages = [39, 45, 29, 24, 50]
    multiple_of_three = 0
    ages.count do |age|
      multiple_of_three += 1 if age % 3 == 0
    end

    expect(multiple_of_three).to eq(3)
  end

  it 'test 6' do
    ages = {
      abdi: 39,
      hassan: 45,
      ladonna: 29,
      margaret: 24,
      miguel: 50
    }
    multiple_of_three = 0
    ages.count do |name, age|
      multiple_of_three += 1 if age % 3 == 0
    end

    expect(multiple_of_three).to eq(3)
  end

  it 'test 7' do
    family = ["alice", "bob", "charlie", "david", "eve"]
    names_with_three_letters = 0
    family.count do |name|
      names_with_three_letters += 1 if name.length == 3
    end

    expect(names_with_three_letters).to eq(2)
  end

  it 'test 8' do
    family = {
      mother: "alice",
      father: "bob",
      brother: "charlie",
      uncle: "david",
      sister: "eve"
    }
    names_with_three_letters = 0
    family.count do |relationship, name|
      names_with_three_letters += 1 if name.length == 3
    end
    expect(names_with_three_letters).to eq(2)
  end

  it 'test 9' do
    prices = [1.0, 3.9, 5.99, 18.5, 20.0]
    whole_numbers = 0
    prices.count do |price|
      whole_numbers += 1 if price == price.floor
    end

    expect(whole_numbers).to eq(2)
  end

  it 'test 10' do
    prices = {
      "shoes" => 1.0,
      "backpack" => 3.9,
      "books" => 5.99,
      "posters" => 18.5,
      "food" => 20.0
    }
    whole_numbers = 0
    prices.count do |item, price|
      whole_numbers += 1 if price == price.ceil
    end
    expect(whole_numbers).to eq(2)
  end
end
