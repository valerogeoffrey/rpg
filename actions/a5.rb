Dir["./personnages/*.rb"].each { |file| require file }

module Actions
    class A5 < A0
        attr_accessor :disclaimer

        def initialize
            @question = ">> 5 + 5 = "
            @response  = 10
            super(@question, @response)
        end


    end
end
