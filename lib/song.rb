require 'pry'

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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      return find_by_name(name)
    end
    create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
            # string
    artist_name = file[0]
    name = file[1].chomp(".mp3")
    new_song = Song.create
    new_song.name = name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
