class TrailFinder::Trail

    attr_accessor :name, :condition, :length, :elevation, :url, :description

    @@all = []

    def initialize(trail_name, condition, length, elevation, trail_url)    
        @name = trail_name
        @condition = condition
        @length = length 
        @elevation = elevation
        @url = trail_url 
        self.save
    end
    
    def save
        self.class.all << self
    end

    def self.all
        @@all
    end 

    def self.destroy_all
        @@all.clear
    end  

end