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
    song.save 
    song
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song.save 
    song
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save 
    song
  end  
  
  def self.find_by_name(name)
    Song.all.find{|s| s.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    Song.find_by_name(name) || Song.create_by_name(name)
  end 
  
  def self.alphabetical 
    self.all.sort_by {|song| song.name}
  end  
  
  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(/[-.]/)[1].strip
    song.artist_name = filename.split(/[-.]/)[0].strip
    song
  end 
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save 
    song
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
end
