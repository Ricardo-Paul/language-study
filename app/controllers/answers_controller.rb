class AnswersController < ApplicationController

  before_action :find_pub, only: [:new,]

  def new
    find_pub
    @answer = @pub.answers.build
  end

  def create
    find_pub
    @answer = Answer.create(answer_params)
    @answer.user_id = current_user.id 
    @answer.pub_id = @pub.id
    if @answer.save
      #raise @answer.inspect
      redirect_to pub_path(@pub)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

  def find_pub
    @pub = Pub.find(params[:id] || params[:pub_id] )
  end
end
