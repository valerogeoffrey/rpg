module Rooms
    class R5 < Generic
        attr_accessor :name, :description, :actions

        def initialize
            @name        = "Room 5 - Death Rooms"
            @description = "You'r the one"
            @action      = []
            super(@name, @description)
        end

        def puts_description
            puts "whatever you want."
        end
    end
end
