class Curator
  attr_reader :photographs,
              :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    artists.find { |artist| artist.id == id }
  end

  def artist_photos
    list = {}
    @artists.each do |artist|
      photos = @photographs.select do |photograph|
        photograph.artist_id == artist.id
      end
    list[artist] = photos
    end
    list
  end

  def artists_with_multiple
    photos_by_artist = @photographs.group_by do |photo|
      photo.artist_id
    end
    multiple = photos_by_artist.select do |_artist_id, photos|
      photos.count > 1
    end
    multiple.map do |artist_id, _photos|
      @artists.find { |artist| artist.id == artist_id }
    end
  end

  def photographs_from(location)
    artist = find_artist_from(location) 
    @photographs.select do |photograph|
      photograph.artist_id == artist.id
    end
  end

  def find_artist_from(location)
    @artists.find { |artist| artist.country == location }
  end
end