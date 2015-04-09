class CoursesController < ApplicationController

                def index
                	@courses=Course.all
                	if params[:Name].present?
                		@courses=@courses.where("Name like?","%#{params[:Name]}%")
                	end
                	if params[:Teacher].present?
                		@courses=@courses.where("Teacher like?","%#{params[:Teacher]}%")
                	end
                	if params[:Time].present?
                		@courses=@courses.where("Name like?","%#{params[:Time]}%")
                	end
                end

                def show
                                @course=Course.find(params[:id])
                end

	def new
	             @course=Course.new
	end

	def  create
		@course=Course.new(course_params)
		if @course.save
			redirect_to root_path\
		else
			render :new
		end
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		if@course.update(course_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		redirect_to root_path
	end

	private

	def course_params
		params.require(:course).permit(:Name,:Teacher,:Time,:Place,:Credit)
	end
end
