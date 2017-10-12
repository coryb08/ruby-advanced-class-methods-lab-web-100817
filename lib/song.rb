class Song

  attr_accessor :name

  @@all = []

  def artist_name
    @artist_name
  end

  def artist_name=(given_argument)
    @artist_name = given_argument
  end


  def self.new_by_name(name)
    # Song.new.name = name
    song = Song.new
    song.name = name
    song
  end


  def self.create_by_name(newSong)
    song = Song.new_by_name(newSong)
    song.save
    song
  end


  def self.create
    song = Song.new
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    self.all.sort{|x,y| x.name <=> y.name}
  end

  def self.new_from_filename(file_name)
    cleanFile = file_name.chomp('.mp3').split(' - ')
    name_of_artist = cleanFile[0]
    song_instance = Song.new_by_name(cleanFile[1])
    song_instance.artist_name=(name_of_artist)
    song_instance
  end

  def self.create_from_filename(file_name)
    cleanFile = file_name.chomp('.mp3').split(' - ')
    name_of_artist = cleanFile[0]
    song_instance = Song.new_by_name(cleanFile[1])
    song_instance.artist_name=(name_of_artist)
    song_instance.save
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.find_by_name(name)
    @@all.detect{|person| person.name == name}
  end

  def self.destroy_all
    @@all = []
  end

end
