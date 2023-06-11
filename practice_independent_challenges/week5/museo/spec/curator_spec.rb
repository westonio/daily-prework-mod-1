require './lib/curator'
require './lib/photograph'
require './lib/artist'

RSpec.describe Curator do
  before(:each) do
    @curator = Curator.new  
    @photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
    })        
    @photo_2 = Photograph.new({
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
    })  
    @photo_3 = Photograph.new({
      id: "3",      
      name: "Sunrise, Hernandez",      
      artist_id: "2",      
      year: "1963"      
    })
    @photo_4 = Photograph.new({
      id: "4",      
      name: "Taipei Bridge",      
      artist_id: "3",      
      year: "1927"      
    })
    @photo_5 = Photograph.new({
      id: "5",      
      name: "The Family of Yang Zhaojia",      
      artist_id: "3",      
      year: "1936"      
    })
    @photo_6 = Photograph.new({
      id: "6",      
      name: "Reclining Nude",      
      artist_id: "3",      
      year: "1936"      
    })
    @artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })      
    @artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })  
    @artist_3 = Artist.new({
      id: "3",      
      name: "Lee Shih-chiao",      
      born: "1908",      
      died: "1995",      
      country: "Taiwan"      
    })  
  end

  it 'exists' do
    expect(@curator).to be_a(Curator)
  end

  it 'starts with no photos or artists' do
    expect(@curator.photographs).to be_empty
    expect(@curator.artists).to be_empty
  end

  it 'adds and lists photos' do
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    expect(@curator.photographs).to eq([@photo_1, @photo_2])
  end

  it 'adds and lists artists' do
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    expect(@curator.artists).to eq([@artist_1, @artist_2])
  end

  it 'can find an artist by id' do
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    expect(@curator.find_artist_by_id("1")).to eq(@artist_1)
  end

  it 'has list of artists and their photographs' do
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)

    expected = {@artist_1 => [@photo_1], @artist_2 => [@photo_2, @photo_3]}
    expect(@curator.artist_photos).to eq(expected)
  end

  it 'has list of artists with numerous photographs' do
    @curator.add_artist(@artist_1)
      @curator.add_photograph(@photo_1)
    @curator.add_artist(@artist_2)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)
    @curator.add_artist(@artist_3)
      @curator.add_photograph(@photo_4)
      @curator.add_photograph(@photo_5)
      @curator.add_photograph(@photo_6)

    expect(@curator.artists_with_multiple).to eq([@artist_2, @artist_3])

  end

  it 'can find artist from given country and lists photographs by the given country' do
    @curator.add_artist(@artist_3)
      @curator.add_photograph(@photo_4)
      @curator.add_photograph(@photo_5)
      @curator.add_photograph(@photo_6)

    expect(@curator.photographs_from("Taiwan")).to eq([@photo_4, @photo_5, @photo_6])
  end
end