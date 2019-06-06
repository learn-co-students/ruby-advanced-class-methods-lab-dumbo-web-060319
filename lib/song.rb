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
      new_song=Song.new
      self.all<< new_song
      new_song
    end

    def self.new_by_name(name)
      song=Song.new
      song.name=name
      song
    end
  
    def self.create_by_name(nname)
      song_created=Song.new
      song_created.name=nname
       self.all<< song_created
       song_created
    end

    def self.find_by_name(name)
      self.all.select{|song_instances| song_instances.name==name}[0]
    end
    
    def self.find_or_create_by_name(name)
      if self.find_by_name(name).nil?
       return self.create_by_name(name)
      else
        return self.find_by_name(name)
      end
    end

    def self.alphabetical
      self.all.sort_by{|song_instances| song_instances.name}
    end

    def self.new_from_filename(artist_with_song)
      arr=artist_with_song.split(" - ")
      artist=arr[0]
      song_name=arr[1].split(".mp")[0]
     song=Song.new
     song.name=song_name
     song.artist_name=artist
     song

    end

    def self.create_from_filename(string)
      song=self.new_from_filename(string)
      self.all<< song
      song
    end


    def self.destroy_all
      @@all = []
    end
end

