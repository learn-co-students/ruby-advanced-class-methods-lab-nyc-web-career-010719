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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find{ |music| music.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{ |word| word.name}
  end

  def self.new_from_filename(song_name)
    base_song = File.basename(song_name, ".mp3").split(" - ")
    song = Song.new
    song.name = base_song[1]
    song.artist_name = base_song[0]
    song
  end

  def self.create_from_filename(song_name)
    base_song = File.basename(song_name, ".mp3").split(" - ")
    song = Song.create
    song.name = base_song[1]
    song.artist_name = base_song[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
  #binding.pry
end
