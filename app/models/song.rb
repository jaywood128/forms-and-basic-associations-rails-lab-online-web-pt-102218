require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre 
  has_many :notes
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  def artist_name 
    self.artist ? self.artist.name : nil
  end

  def genre_id=(ids)
    ids.each do |id|
      genre = Genre.find(id)
      self.genre << genre 
    end
  end

  def genre_id
    self.genre.id ? self.artist.genre.id : nil
  end
  # add associations here
end
