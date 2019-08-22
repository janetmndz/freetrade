class QuestionAnswersController < ApplicationController
    before_action :find_q_a, only: [:edit, :update]
    def create
        @question = QuestionAnswer.create(question_params)
        if @question.valid?
            redirect_to @question.item
        else
            flash[:message] = @question.erros.full_messages
            redirect_to @question.item
        end
    end

    def edit
        if @current_user != @question.item.user
            redirect_to @question.item
        end
    end

    def update
        @question.update(answer_params)
        redirect_to @question.item
    end

    private

    def question_params
        params.require(:question_answer).permit(:question, :item_id)
    end
    def answer_params
        params.require(:question_answer).permit(:answer)
    end
    def find_q_a
        @question = QuestionAnswer.find(params[:id])
    end
end
