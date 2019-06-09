require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name
    @artist_name

    @@all << self
  end

  def self.all
    @@all
  end

  def self.create
    song = Song.new
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)

  end

  def self.find_or_create_by_name(name)
    
  end

  def self.alphabetical
    @@all.map{ |song| song.sort }
  end

  def self.new_from_filename(file)

  end

  def self.create_from_filename(file)

  end

  def self.destroy_all
    @@all = []
  end


end
