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
  	song = self.new
  	@@all << song
  	song.save
  	song
  end

  def self.name= (name)
  	@name = name
  end

  def self.new_by_name (name)
  	song = self.create
  	song.name = name
  	song
  end

  def self.create_by_name (name)
  	song = self.new_by_name(name)
  	song
  end

  def self.find_by_name (name)
  	test_song = @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
  	song_find = self.find_by_name(name)
  	if song_find == nil
  	  return self.create_by_name(name)
  	else
  	  return song_find
  	end
  end

  def self.alphabetical 
  	song_names = []
  	@@all.sort_by {|song| song.name }.uniq
  end

  def self.new_from_filename (file_name)
  	song = self.new
    file_name = file_name.split(" - ")
    song.artist_name = file_name[0]
    song_name = file_name[1].split(".")
    song.name = song_name[0]
    song
  end

  def self.create_from_filename (file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end

#Song.new_from_filename("Thundercat - something.mp3")