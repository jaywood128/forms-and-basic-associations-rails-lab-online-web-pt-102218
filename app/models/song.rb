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

  def note_contents=(notes)
    
    notes.each do |note|
      if note.strip != ""
        self.notes.build(content: note) 
        self.save 
      end
    end 
    
  end

  def note_contents
    self.notes.map do |note| 
      note.content 
    end 
  end

  def genre_name=(genre)
    @genre = Genre.find_by_name(genre) 
    self.genre_id = @genre.id 
    self.save
  end 

  def genre_name 
    self.genre.name 
  end 

  # add associations here
end
