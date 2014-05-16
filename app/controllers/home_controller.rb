class HomeController < ApplicationController
  before_action :logged_in 


  def index
    @readings = Reading.all
    recentSize=6
    if recentSize < @readings.length
      @recentReadings = @readings.drop(@readings.length-recentSize).reverse
    else 
      @recentReadings = @readings.drop(0).reverse
    end
  end

  private
  #redirects user if they are not logged in
  def logged_in
    if current_user == nil
      redirect_to new_user_session_path
    end
  end
  
end
