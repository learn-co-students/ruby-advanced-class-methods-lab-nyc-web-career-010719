require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize()
    # @name = name
    @@all << self
  end

  def self.create
    song = self.new
    # song.name = song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    self.all.find{|song| song.name == song}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    # return song
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
    # .sort receives 2 objects, .sort_by receives one
  end

  def self.new_from_filename(filename)
    song_file = filename.split (" - ")
    artist_name, song_name, genre_name = song_file.first, song_file[1], song_file[2]
    # binding.pry
    song_name = song_name.split(".mp3")[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song_file = filename.split (" - ")
    artist_name, song_name, genre_name = song_file.first, song_file[1], song_file[2]
    # binding.pry
    song_name = song_name.split(".mp3")[0]
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
