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
end