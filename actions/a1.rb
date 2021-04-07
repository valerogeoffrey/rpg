module Actions
    class A1 < A0
        attr_accessor :disclaimer

        def initialize
            @question = " >> 1 + 1 = "
            @response = 2

            super(@question, @response)
        end
    end
end
