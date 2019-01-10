require "pry"

class Bicycle

  attr_reader :tire

    def initialize(tire, gears, style)
      @tire = tire
      @gears = gears
      @style = style
    end

    def tire_size
      self.tire
      binding.pry
    end

    def self.gears
      @gears
    end

end

mongoose = Bicycle.new(4, 10, "BMX")

# For what reasons will the following method calls fail
# :mongoose.tire_size = 5,
# mongoose.gears,
# Bicycle.bikes,
# Bicycle.style?
# Restructure the class to fix the issues.
