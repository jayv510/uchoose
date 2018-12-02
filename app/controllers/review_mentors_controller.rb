class ReviewMentorsController < ApplicationController
  def new
    # @mentor = Mentor.find(params[:mentor_id])
    @review_mentor = ReviewMentor.new
  end

  def create
    @mentor = Mentor.find(params[:mentor_id])
    @review_mentor = ReviewMentor.new(review_mentor_params)
    @review_mentor.mentor = @mentor
    if @review_mentor.save
      redirect_to mentor_path(@mentor)
    else
      render "mentors/show"
    end
  end

  private
    def review_mentor_params
    params.require(:review_mentor).permit(:rating, :content)
  end
end
