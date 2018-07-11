require "pry"
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

  def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
      self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
      binding.pry
        note_array = notes.find do |note|
           note != "" || note != ''
       end
       binding.pry

        self.notes << Note.find_or_create_by(:content => note_array)
  end

  def note_contents
      binding.pry
      self.notes.collect do |note|
          note.content
      end
  end

end
