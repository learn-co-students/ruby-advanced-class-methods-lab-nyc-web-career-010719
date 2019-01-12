class Song
  attr_reader :name, :artist_name
  @@all = []

  def initialize(name)
    @name = name
  end

  def create

  end

  def self.all
    @@all
  end

  def save
    self.all << self
  end

end
