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

  def self.create ()
    s = Song.new()
    @@all << s
    return s
  end

  def self.new_by_name(name)
     s = Song.new()
     s.name =name
     return s

  end
  def self.create_by_name(name)
    s= Song.new()
    s.name = name
    @@all << s
    return s
  end

  def self.find_by_name(name)
    Song.all.find {|p|p.name == name}
    # Person.all.find{|p| p.name == "Ada Lovelace"}
  end
  def self.find_or_create_by_name(name)
    if find_by_name(name)!=nil
      return find_by_name(name)
    end
    create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|a|a.name}
    # print @@all
    # @@all

  end

  def self.new_from_filename(filename)

    str = filename.split(' - ')
    artist = str[0]
    song_name = str[1].chomp(".mp3")
     s = Song.create()
    s.name = song_name
    s.artist_name = artist
    # s = create_by_name(str[1])
    #
    # s.name = str[1][0..-5]
    # s.artist_name =str[0]
    s
  end
# binding.pry
  # binding.pry

  def self.create_from_filename(filename)
    str = filename.split(' - ')
    artist = str[0]
    song_name = str[1].chomp(".mp3")
     s = Song.create()
    s.name = song_name
    s.artist_name = artist
    @@all << s
  end

  def self.destroy_all
    @@all=[]
  end

end
