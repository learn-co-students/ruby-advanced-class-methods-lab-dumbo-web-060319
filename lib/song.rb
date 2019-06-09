
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    #Places a Song instance object into @@all
    self.class.all << self
  end

  def self.create
    #instantiates and saves the song, and it returns the new song that was created
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(name)
    #instantiates a song with a name property
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    # self.all.collect { |song| song.name }.sort
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    #"Taylor Swift - Blank Space.mp3"
    arr = file_name.split(" - ")
    artist = arr[0]
    arr2 = arr[1].split(".")
    name = arr2[0]
    file = arr2[1]
    song = self.new
    song.name = name
    song.artist_name = artist
    return song
  end

  def self.create_from_filename(file_name)
    arr = file_name.split(" - ")
    artist = arr[0]
    arr2 = arr[1].split(".")
    name = arr2[0]
    file = arr2[1]
    song = self.new
    song.name = name
    song.artist_name = artist
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
