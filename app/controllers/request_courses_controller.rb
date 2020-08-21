class RequestCoursesController < ApplicationController
  before_action :set_req_course, only: [:show, :update, :edit]
  before_action :authenticate_user!

  def index
    @q = current_user.request_courses.ransack(params[:q])
    @request_courses = @q.result
    @request_courses = RequestCourse.all if current_user.teacher?
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @courses}
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @course}
    end
  end

  def edit
  end

  def create
    if current_user.request_courses.this_month.count <= 2
      @request_courses = current_user.request_courses.build(course_id: params[:course_id])
      respond_to do |format|
        if @request_courses.save
          format.html { redirect_to courses_path, notice: 'Course join request was successfully created.' }
          format.json { render json: @request_courses }
        else
          format.html { redirect_to courses_path, alert: 'You have already joined this course' }
          format.json { render json: @request_courses.errors }
        end
      end
    else
      redirect_to courses_path, notice: "You can't join more than 3 in a month"
    end
  end

  def update
    respond_to do |format|
      if @request_course.update(status: params[:request_course][:status])
        format.html { redirect_to @request_course, notice: "Updated successfully!" }
      else
        format.html { render :edit }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_req_course
    @request_course = RequestCourse.find(params[:id])
  end

end
