require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      song = self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |word| word.name }
  end

  def self.new_from_filename(song)
    formatted = song.split(" - ")
    artist = formatted[0]
    song_name = formatted[1].chomp(".mp3")
    new_song = Song.create
    new_song.name = song_name
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file)
    formatted = new_from_filename(file)
  end

  def self.destroy_all
    @@all = []
  end

end
