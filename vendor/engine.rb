Dir["./actions/*.rb"].each { |file| require file }
Dir["./rooms/*.rb"].each { |file| require file }

class Engine

    def initialize
        @moove               = ""
        @has_no_error        = true
        @voldemort_is_alive  = true
        @available_direction = [:forward, :back, :left, :right]
        @position            = :r1
        @rooms               = {
            :r1 => {
                :mooves  => {
                    :forward => :r2
                },
                :actions => [:A1]
            },
            :r2 => {
                :mooves  => {
                    :back => :r1,
                    :forward  => :r5,
                },
                :actions => [:A2]
            },
            :r5 => {
                :mooves  => {},
                :actions => [:A5]
            },
        }

        @extra_map =
            {
                :r3 => {
                    :mooves  => {
                        :right  => :r2,
                        :back => :r4,
                    },
                    :actions => [:A3]
                },
                :r4 => {
                    :mooves  => {
                        :left  => :r1,
                        :right  => :r5,
                        :back => :r3,
                    },
                    :actions => [:A4]
                },
            }
    end


    def set_position(position)
        @position = position

        self
    end

    def get_moves
        @rooms[@position][:mooves].keys.join(' / ')
    end

    def get_position
        @position
    end

    def is_final_room?
        self.get_position == :r5
    end

    def is_not_in_final_room?
        self.get_position != :r5
    end

    def init_scenario
        if self.get_position == :r1
            room = self.get_room
            room.puts_description
            room.execute_actions
            puts "Where do you want to go ?  ( #{self.get_moves} )"
        end
    end

    def get_next_room
        @rooms[@position][:mooves][@moove]
    end

    def set_moove(moove)
        @moove = moove.to_sym
        self
    end

    def get_moove
        @moove
    end

    def is_legal_moove?
        @available_direction.include?(@moove) ? true : false
    end


    def get_room
        actions        = @rooms[@position][:actions]
        action_classes = get_action_class(actions)

        Object.const_get("Rooms::#{@position.to_s.upcase}").new
            .set_actions(action_classes)
    end

    def get_action_class(actions)
        actions_list = []
        actions.each { |a| actions_list << Object.const_get("Actions::#{a.to_s.upcase}").new }
        actions_list
    end
end
