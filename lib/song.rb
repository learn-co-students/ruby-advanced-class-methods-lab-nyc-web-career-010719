require "pry"
class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end #End of create method

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end #End of new_by_name method

  def self.create_by_name(song_name)
    song = self.new
    song.save
    song.name = song_name
    song
  end #End of create_by_name method

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end #End of find_by_name method

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end #End of find_or_create_by_name method

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end #End of alphabetical method

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    artist_name = filename[0]
    song_name = filename[1]
    # binding.pry
    filename[1].slice!(".mp3")
    song_name = filename[1]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end #End of new_from_filename method

  def self.create_from_filename(filename)
    song_parts = filename.split(" - ")
    artist_name = song_parts[0]
    song_name = song_parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end #End of create_from_filename method

  def self.destroy_all
    self.all.clear
  end #End of destroy_all method

  def self.all
    @@all
  end #End of all method

  def save
    self.class.all << self
  end #End of save method

end #End of Song class
