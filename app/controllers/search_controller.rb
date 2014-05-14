class SearchController < ApplicationController
  before_action :logged_in

  def index
      if params[:search]
          ids = params[:search][:tag_id].reject(&:empty?)
          @readings = Reading.search(ids)
          @tags = Tag.find(ids)
      else
          @readings = []
          @tags = []
      end
  end

  private
  #redirects to sign up page is user is not logged in
  def logged_in
    if current_user == nil
      redirect_to new_user_session_path, alert: "You are not logged in"
    end
  end
end