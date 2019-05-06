class TrailFinder::Trail

    attr_accessor :name, :condition, :length, :elevation, :url, :description

    @@all = []

    def initialize(trail_name, condition, length, elevation, trail_url)    # might incorporate mass assignment?
        @name = trail_name
        @condition = condition
        @length = length 
        @elevation = elevation
        @url = trail_url 
        self.save
    end 

    def self.trails
        
        trails = [] 
        
        # trail_1 = self.new << trails 
        # trail_1.name = "Arnold Ice Cave"
        # trail_1.condition = "Riding Well"
        # trail_1.length = "13.9 miles" 
        # trail_1.elevation = "1975'"
        # trail_1.url = "https://bendtrails.org/trail/arnold-ice-cave/"
        # trail_1.description = "lorem"
        # trails 

    end 

    def self.all
        @@all
    end 

    def save
        self.class.all << self
    end
    
    def self.destroy_all
        @@all.clear
    end 

    def self.create(name)
        trail = self.new(name)
        trail.save
    end 

    def self.find_by_skill_level(skill_level)
        self.all.detect {|trail| trail.skill_level == skill_level}
    end
    
    

end