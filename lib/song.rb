class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create
    song = Song.new
  end

  def self.new_by_name(name)

  end

  def self.create_by_name(name)

  end

  def self.find_or_create_by_name(name)
    
  end

  def self.destroy_all
    @@all = []
  end


end
