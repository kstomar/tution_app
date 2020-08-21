class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @course, notice: 'Comment was successfully created.' }
        format.json { render json: @comment}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def set_course
    @course = Course.find_by(id: params[:comment][:course_id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :course_id).merge(user_id: current_user.id)
  end
end