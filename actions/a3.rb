module Actions
    class A3 < A0
        attr_accessor :disclaimer

        def initialize
            @question = ">> 3 + 3 = "
            @response  = 6

            super(@question, @response)

        end
    end
end
