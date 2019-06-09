require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize
  #   @name
  #   @artist_name

  #   @@all << self
  # end

  def self.all
    @@all
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
    song = new_by_name(name)
    @@all << song

    song
  end

  def self.find_all_names
    @@all.map { |song| song.name }
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_all_names.include? name
        Song.find_by_name(name)
    else
        Song.create_by_name(name)
    end
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
