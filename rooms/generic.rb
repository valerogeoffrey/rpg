module Rooms
    class Generic

        def initialize(name,description)
            @name = name
            @description = description
            @actions = []
        end

        def get_name
            @name
        end

        def get_actions
            @actions
        end

        def get_description
            @description
        end

        def puts_description
            puts " "
            puts "//////////////////////////////////////////////////////////////////////////////////"
            puts "You are currently in : #{@name}"
            puts "#{@description}"
            puts "Your goal is to go to the Final room named Death Rooms"
        end

        def set_actions(actions)
            @actions = actions
            self
        end

        def execute_actions
            self.actions.each do |action|
                is_no_good_for_next = true
                while is_no_good_for_next
                    puts action.ask_question
                    response_action     = STDIN.gets.chomp.to_i
                    good_response   = action.set_response(response_action).is_good_answer?
                    puts action.disclaimer if good_response
                    is_no_good_for_next = !good_response
                end
            end
        end
    end
end