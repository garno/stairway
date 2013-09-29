module Stairway
  class Stairs

    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def steps=(steps)
    end

    def run
      puts @name
    end

  end
end
