class HomeController < ApplicationController
  before_action :logged_in 


  private
  #redirects user if they are not logged in
  def logged_in
    if current_user == nil
      redirect_to new_user_session_path
    end
  end
  
end
