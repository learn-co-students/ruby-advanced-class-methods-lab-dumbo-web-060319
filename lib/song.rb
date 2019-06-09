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

  def self.new_by_name(name_of_song)
     song = Song.new
     song.name = name_of_song
     song
  end

  def self.create_by_name(name_of_song)
    song = Song.new
    song.name = name_of_song
    song.save
    song
  end

  def self.find_by_name(name_of_song)
    self.all.find {|song| song.name == name_of_song}
  end

  def self.find_or_create_by_name(name_of_song)
    if self.find_by_name(name_of_song) == nil
      self.create_by_name(name_of_song)
    else
      self.find_by_name(name_of_song)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    songform = self.new
    songform.name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    songform.artist_name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[0]
    songform
  end

  def self.create_from_filename(file_name)
    songform = self.new
    songform.name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[1]
    songform.artist_name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[0]
    songform.save
    songform
  end

  def self.destroy_all
    self.all.clear
  end


end
