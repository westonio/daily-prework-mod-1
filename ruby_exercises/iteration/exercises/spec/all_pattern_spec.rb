RSpec.describe 'all pattern' do
  it 'test 1' do
    account_balances = [0, 0, 0, 0, 0, 0, 0]
    all_zeros = false
    account_balances.all? do |balance|
      all_zeros = balance.zero?
    end
    expect(all_zeros).to be true
  end

  it 'test 2' do
    account_balances = {
      checking: 0,
      saving: 0,
      retirement_401k: 0,
      retirement_ira: 0,
    }
    all_zeros = false
    account_balances.all? do |account, balance|
      all_zeros = balance.zero?
    end
    expect(all_zeros).to be true
  end

  it 'test 3' do
    words = ["love", "hate", "fire", "bird", "call"]
    all_four_letters = false
    words.all? do |word|
      all_four_letters = word.length == 4
    end
    expect(all_four_letters).to be true
  end

  it 'test 4' do
    words = {
      one: "love",
      two: "hate",
      three: "fire",
      four: "bird",
      five: "call"
    }
    all_four_letters = true
    words.all? do |position, word|
      all_four_letters = word.length == 4
    end
    expect(all_four_letters).to be true
  end

  it 'test 5' do
    statuses = [:busy, :busy, :busy]
    all_busy = true
    statuses.all? do |status|
      all_busy = status == :busy
    end
    expect(all_busy).to be true
  end

  it 'test 6' do
    friend_status = {
      "Megan" => :busy,
      "Sarah" => :busy,
      "Duncan" => :busy,
    }
    all_busy = false
    friend_status.all? do |friend,status|
      all_busy = status == :busy
    end

    expect(all_busy).to be true
  end

  it 'test 7' do
    zip_codes = [94381, 831, 50009, 36232, 8992, 89999, 11110]
    all_five_digits = true
    zip_codes.all? do |zip_code|
      all_five_digits = zip_code.to_s.length == 5
    end

    expect(all_five_digits).to be false
  end

  it 'test 8' do
    zip_codes = {
      "Megan" => 94381,
      "Sarah" => 831,
      "Duncan" => 50009,
      "Raymart" => 36232,
      "Alec" => 89092,
      "Cameron" => 89999,
      "Joshua" => 11110
    }
    all_five_digits = true
    zip_codes.all? do |zip_code|
      all_five_digits = zip_code.to_s.length == 5
    end

    expect(all_five_digits).to be false
  end

  it 'test 9' do
    snacks = ["GARLIC PLANTAINS", "SNICKERDOODLES", "Pretzels"]
    all_caps = true
    snacks.all? do |snack|
      all_caps = snack == snack.upcase
    end
    expect(all_caps).to be false
  end

  it 'test 10' do
    snacks = {
      savory: "GARLIC PLANTAINS",
      sweet: "SNICKERDOODLES",
      salty: "Pretzels"
    }
    all_caps = true
    snacks.all? do |type,snack|
      all_caps = snack.upcase == snack
    end
    expect(all_caps).to be false
  end
end
