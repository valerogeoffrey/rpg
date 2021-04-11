class Map
    attr_accessor :rooms
    def initialize
        @rooms = {
            :r1 => {
                :mooves  => {
                    :devant => :r2,
                    :droite => :r4
                },
                :actions => [:A1]
            },
            :r2 => {
                :mooves  => {
                    :arriere => :r1,
                    :devant  => :r5,
                    :gauche  => :r3
                },
                :actions => [:A2]
            },
            :r3 => {
                :mooves  => {
                    :droite  => :r2,
                    :arriere => :r4,
                },
                :actions => [:A3]
            },
            :r4 => {
                :mooves  => {
                    :gauche  => :r1,
                    :droite  => :r5,
                    :arriere => :r3,
                },
                :actions => [:A4]
            },
            :r5 => {
                :mooves  => {},
                :actions => [:A5]
            },

        }
    end
end
