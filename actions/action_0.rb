module Actions
    class Action0
        def initialize (question, response)
            @question     = question
            @response      = response
            @user_response = ""
            @disclaimer = "Well done you found the right answer, you will be able to move on the next room"
        end

        def get_response
            @response
        end

        def get_question
            @question
        end

        def ask_question
            puts @question
        end

        def set_response(response)
            @user_response = response
            self
        end

        def get_user_response
            @user_response
        end

        def is_good_answer?
            @user_response == @response
        end
    end
end
