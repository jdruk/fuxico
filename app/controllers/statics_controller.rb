class StaticsController < ApplicationController
  def homepage
    redirect_to new_user_session_path unless user_signed_in?
  end
end
