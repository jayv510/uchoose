# frozen_string_literal: true

class Mentors::SessionsController < Devise::SessionsController
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
    if params[:query].present?
      @mentors = Mentor.search(params[:query], {
        fields: ["university^10", "major_category^5", "major^5", "nationality^3", "first_name", "last_name", "degree_level", "rate", "description", "description_two"],
        # match: :exact,
        misspellings: { edit_distance: 1, below: 5 },
        aggs: [:university, :nationality, :major_category, :major, :first_name, :last_name, :degree_level]
      })
      # add adjustments to search here
      @result = "Showing mentors matching \"#{params[:query]}\""
    else
      @mentors = Mentor.all
    end
  end

  def show
    @mentor = Mentor.find(params[:id])
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
