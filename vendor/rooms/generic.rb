require "./vendor/actions/action_executer.rb"
require "./vendor/actions/Action.rb"
module Rooms
  class Generic

    attr_reader :name, :description, :actions

    def initialize(name, description)

      @action_executer = Actions::ActionExecuter.new
      @name            = name
      @description     = description
      @actions         = []
      @moves           = {}
      @is_first_room   = false
    end

    def puts_description
      puts " "
      puts "//////////////////////////////////////////////////////////////////////////////////"
      puts "You are currently in : #{name}"
      puts "#{description}"
      puts "Your goal is to go to the Final room named Death Rooms"
    end

    def link_actions(actions)
      @actions = actions
      self
    end

    def link_moves(moves)

    end

    def execute_actions
      @actions.each do |action|
        is_no_good_for_next = true
        while is_no_good_for_next
          puts action.ask_question
          response_action = STDIN.gets.chomp.to_i
          good_response   = action.set_response(response_action).is_good_answer?
          puts action.disclaimer if good_response
          is_no_good_for_next = !good_response
        end
      end
    end
  end
end