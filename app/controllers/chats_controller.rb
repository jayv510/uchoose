class ChatsController < ApplicationController
  before_action :authenticate_mentor!
  before_action :authenticate_prospective!

  def show
  end
end
