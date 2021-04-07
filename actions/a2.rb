module Actions
    class A2 < A0
        attr_accessor :disclaimer

        def initialize
            @question = ">> 2 + 2 = "
            @response = 4

            super(@question, @response)
        end
    end
end
