module Actions
    class A4 < A0
        attr_accessor :disclaimer

        def initialize
            @question = ">> 4 + 4 = "
            @response  = 8

            super(@question, @response)
        end
    end
end