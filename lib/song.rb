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
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.detect {|i| i.name == name}
  end
  
  def self.find_or_create_by_name(name) 
    if self.find_by_name(name) == nil 
      self.create_by_name(name)
    else 
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort do |a,b|
      if a == b 
        0 
      elsif a > b 
        1 
      else a < b 
        -1
      end
    end
        
  end
    
  def self.new_from_filename(name)
    song = self.new
    song.name = name.split(" - ")[1].chomp(".mp3")
    song.artist_name = name.split(" - ")[0]
    @@all << song
    song
  end
    

end
