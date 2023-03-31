class Api::V1::CoursesController < ApplicationController

  def index
    @course = Course.includes(:tutors)
    render json: @course, include: :tutors
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render json: CourseSerializer.new(@course).serialized_json
    else
      render json: ErrorSerializer.new(@course.errors, 422).serialized_json
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, tutors_attributes: [:name, :email])
  end
end


# Note
# I have created custom classes to display the response success and error message and for large application we will use some serializers to provide accurate response based on object status. 