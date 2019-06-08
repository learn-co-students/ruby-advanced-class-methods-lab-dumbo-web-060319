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
		new_song = Song.new
		@@all << new_song
		new_song
	end

	def self.new_by_name(song_name)
		new_song = self.create
		new_song.name = song_name
		new_song
	end

	def self.create_by_name(song_name)
		new_song = self.create
		new_song.name = song_name
		new_song
	end

	def self.find_by_name(song_name)
		@@all.find {|s| s.name == song_name}
	end

	def self.find_or_create_by_name(song_name)
		if self.find_by_name(song_name)
			self.find_by_name(song_name)
		else
			self.create_by_name(song_name)
		end
	end

	def self.alphabetical
		@@all.sort_by {|s| s.name}
	end

	def self.new_from_filename(file_name)
		name_array = file_name.split(/\ - |\./).tap(&:pop)
		new_song = self.create_by_name(name_array[1])
		new_song.artist_name = name_array[0]
		new_song
	end

	def self.create_from_filename(file_name)
		new_song = self.new_from_filename(file_name)
		@@all << new_song
	end

	def self.destroy_all
		@@all = []
	end

end
