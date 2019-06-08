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
    x=Song.new 
    @@all << x 
    return x 
  end
  
  def self.new_by_name(str)
    y=Song.new 
    y.name = str 
    return y
  end
  
  def self.create_by_name(str)
    z=Song.new 
    z.name = str 
    @@all << z
    return z
  end
  
  def self.find_by_name(string)
    find = false 
    @@all.each do |song|
      if song.name == string 
        find = true 
        return song 
      end
    end
    return find 
  end
  
  def self.alphabetical
    x=@@all.sort_by{|x| x.name}
  end
  
  def self.new_from_filename(filename)
    actualFile = filename.chomp(".mp3")
    fileArray= actualFile.split(" - ")
    x=Song.new 
    x.name = fileArray[1]
    x.artist_name = fileArray[0]
    return x
  end
  
  def self.create_from_filename(filename)
    mysong = self.new_from_filename(filename)
    @@all << mysong
  ends
  
  def self.destroy_all
    self.all.clear
  end
end
