
class Song
  attr_accessor :name, :artist_name

#Class level

  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    new_song.save
    return new_song
  end

  def self.new_by_name(name)
    new_named_song = create
    new_named_song.name = name
    return new_named_song
  end

  def self.create_by_name(name)
    new_by_name(name)  
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_song = find_by_name(name)
    if !find_song
      return create_by_name(name)
    else
      return find_song
    end
  end

  def self.alphabetical
    all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    name = filename.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    artist_name = filename.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song_record = find_or_create_by_name(name)
    song_record.artist_name = artist_name
    song_record
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def self.destroy_all
    all.clear
  end

#Instance level

  def save
    self.class.all << self
  end

end