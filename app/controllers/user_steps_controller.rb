class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :contact
  
  #created wizard for first time login
  def show
    @user = current_user
    render_wizard
  end

  #updates the params for wizard
  def update
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      puts params
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    @user = current_user
    @user.update_attributes(user_params)
    current_user.save
    render_wizard @user
  end
  
  def edit
  end  

  def user_params
    if @user.type == 'Student'
      params[:student].permit(:first_name, :email, :last_name, :linkedIn, :major, :avatar, :grad_year)
    else
      params[:alum].permit(:first_name, :email, :last_name, :linkedIn, :major, :avatar, :grad_year)
    end
  end
end