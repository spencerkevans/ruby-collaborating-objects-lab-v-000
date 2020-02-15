class Artist
	attr_accessor :name

	@@all = []

	def initialize(name)
		@name = name
		@@all << self
	end

	def self.all
		@@all
	end

	def songs
		Song.all.select { |s| s.artist == self }
	end

	def add_song(song)
		song.artist = self
	end

	def self.create_by_name(artist_name)
  		artist = self.new(artist_name)
  		artist.name = artist_name
  		@@all << artist
  		artist
  	end

  	def self.find_by_name(artist_name)
  		self.all.find{|artist| artist.name == artist_name}
  	end

  	def self.find_or_create_by_name(artist_name)
  		self.find_by_name(artist_name) || self.create_by_name(artist_name)
  	end
	
	def print_songs
		self.songs.each do |song|
			puts song.name
		end
	end
end