class Trail

    attr_accessor :name, :condition, :length, :elevation, :skill_level, :description

    @@all = []


    def intialize(name)    # might incorporate mass assignment?
        @name = name
        self.save
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

    # def self.find_by_skill_level(skill_level)
    #     self.all.detect {|trail| trail.skill_level == skill_level}
    # end 


