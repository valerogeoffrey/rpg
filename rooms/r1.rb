module Rooms
    class R1 < Generic
        attr_accessor :name, :description, :actions

        def initialize
            @name        = "Common room - Gryffondor"
            @description = "You are in the east wing, in the dungeon of spells."

            super(@name, @description)
        end

        def puts_description
            puts "//////////////////////////////////////////////////////////////////////////////////"
            puts "Welcome ! The game begins, you will have to move on and win the challenges of each room"
            puts "You are currently in : #{@name}"
            puts "Your goal is to go to the Final room named Death Rooms"
            puts "But before that, you'll have to answer this question :"
        end
    end
end
