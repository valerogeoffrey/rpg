Dir["./characters/*.rb"].each { |file| require file }

module Actions
    class Action5 < Action0
        attr_accessor :disclaimer

        def initialize
            @question = ">> 5 + 5 = "
            @response  = 10
            super(@question, @response)
        end


    end
end
