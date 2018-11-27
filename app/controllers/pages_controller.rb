class PagesController < ApplicationController
  skip_before_action :authenticate_mentor!, only: :home

  def home
  end
end
