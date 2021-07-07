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
    song.save
    song

  end

  def self.new_by_name(song_name)

    song = self.new
    song.name = song_name
    song

  end

  def self.create_by_name(song_name)

    song = self.new
    song.name = song_name
    song.save
    song

  end

  def self.create_by_artist(the_artists_name)

    song = self.new
    song.artist_name = the_artists_name
    song.save
    song

  end


  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)

    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end

  end

  def self.alphabetical

    @@all.sort_by{|song| song.name}

  end

  def self.new_from_filename(file)

    a = file.split(" - ")
    artist_name_from_file = a[0]
    song_name_from_file = a[1]
    final_song_name = song_name_from_file.split(".")

    song = self.new
    song.name = final_song_name[0]
    song.artist_name = artist_name_from_file
    song

  end

  def self.create_from_filename(file)

    a = file.split(" - ")
    artist_name_from_file = a[0]
    song_name_from_file = a[1]
    final_song_name = song_name_from_file.split(".")

    song = self.create
    song.name = final_song_name[0]
    song.artist_name = artist_name_from_file
    song

  end

  def self.destroy_all
    @@all.clear
  end


# binding.pry
end
