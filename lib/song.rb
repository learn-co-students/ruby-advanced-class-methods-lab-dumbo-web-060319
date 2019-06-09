require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    if Song.find_by_name(name)
        song = Song.find_by_name(name)
    else
        song = Song.create_by_name(name)
    end

    song
  end 

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    song = Song.new

    record_chunks = file.split(" - ")
    song.artist_name = record_chunks[0]

    song.name = record_chunks[1].split('.mp3')[0]

    song
  end

  def self.create_from_filename(file)
    song = new_from_filename(file)
    @@all << song
  end

  def self.destroy_all
    @@all = []
  end


end
