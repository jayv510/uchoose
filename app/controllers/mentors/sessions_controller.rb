# frozen_string_literal: true

class Mentors::SessionsController < Devise::SessionsController
    # before_action :authenticate_prospective!
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   try
  #    super
  #   catch(err)
  #   print err
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def index

    # def search_data
    #       {
    #   all: [:university, :major, :major_category, :nationality, :first_name, :last_name].join(" ")
    # }
    # end

    if params[:query].present?
            # @mentors = Mentor.where('university LIKE params[:query] OR major LIKE params[:query] OR major_category LIKE params[:query] OR first_name LIKE params[:query] OR last_name LIKE params[:query]', params[:query] == "%#{query}%")


        # -----elastic search----
        # ,{
        # fields: ["university^10", "major_category^5", "major^5", "nationality^3", "first_name", "last_name", "degree_level", "rate", "description", "description_two"],
        # operator: "OR",
        # match: :word_start,
        # all: [:university, :major, :major_category, :nationality, :first_name, :last_name].join(" "),
        # misspellings: { edit_distance: 1, below: 5 },
      #   # aggs: [:university, :nationality, :major_category, :major, :first_name, :last_name, :degree_level]
      # })

      @mentors_with_nan = Mentor.search(params[:query])
      @mentors_no_nan = @mentors_with_nan.reject{ |x| x.average_review.nan?}
      @mentors = @mentors_no_nan.sort_by{|x|x.average_review}.reverse
        # ,{
        # index: "analyzed",
        # fields: [:university, :major_category, :major, :nationality, :first_name, :last_name, :degree_level],

      #   fields: ["university^10", "major_category^5", "major^5", "nationality^3", "first_name", "last_name", "degree_level", "rate", "description", "description_two"],
      #   # match: :word_start,
      #   misspellings: { edit_distance: 1, below: 5 },
      #   aggs: [:university, :nationality, :major_category, :major, :first_name, :last_name, :degree_level]
      # })
      # add adjustments to search here
      @result = "Showing mentors matching \"#{params[:query]}\""

    else

      #sorting
      if params[:sortname].present?
          @mentors = Mentor.all.order(:first_name)

      elsif params[:sortreview].present?

          @mentors_no_nan = Mentor.all.reject{ |x| x.average_review.nan?}
          @mentors = @mentors_no_nan.sort_by{|x|x.average_review}.reverse

      elsif params[:sortmajor].present?
          @mentors = Mentor.all.order(:major)

      elsif params[:sortuniversity].present?
          @mentors = Mentor.all.order(:university)

      else
        @mentors = Mentor.all.order(:first_name)
      end
    end
  end

  def show
    @mentor = Mentor.find(params[:id])
    @prospective = current_prospective
    # @review_mentors = @mentor.review_mentors
  end

  def edit
    @mentor = Mentor.find(params[:id])
  end

  def update
    @mentor = Mentor.find(params[:id])
    @mentor.update!(mentor_params)
    redirect_to mentor_path(@mentor)
  end

  private

  def mentor_params
    params.require(:mentor).permit(:email, :password, :first_name, :last_name, :nationality, :university, :major, :major_category, :degree_level, :description, :description_two, :rate, :photo)
  end
end
