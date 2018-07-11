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

        notes.find_all do |note|
           if note != "" || note != ''
               self.notes << Note.create(:content => note)
           end
       end
  end

  def note_contents
      n = []
     self.notes.each do |note|
        n << note.content
      end
      n.split(" ")
  end

end
