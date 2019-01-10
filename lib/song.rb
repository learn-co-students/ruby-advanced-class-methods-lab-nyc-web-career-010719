require 'pry'

class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.create
    song = self.new
    song.save
    @@all[-1]
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(song_string)
    song = self.new
    song.name = song_string
    # binding.pry
    song
  end

  def self.create_by_name(song_string)
    song = self.new
    song.name = song_string
    song.save
    song
  end

  def self.find_by_name(song_string)
    self.all.detect {|i| i.name == song_string}
  end

  def self.find_or_create_by_name(song_string)
    if self.find_by_name(song_string) == nil
      self.create_by_name(song_string)
    else
      self.find_by_name(song_string)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name.downcase }
  end

  def self.new_from_filename(filename_string)
    song = self.new
    song.name = (filename_string.split " - ")[1].chomp(".mp3")
    song.artist_name = (filename_string.split " - ")[0]
    @@all << song
    song
  end

  def self.create_from_filename(filename_string)
    song = self.new
    song.name = (filename_string.split " - ")[1].chomp(".mp3")
    song.artist_name = (filename_string.split " - ")[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
  # binding.pry


end
