class RegistrationsController < Devise::RegistrationsController


  def after_sign_up_path_for(resource)
    user_steps_path
   # edit_user_registration_path({profile: "true"})
  end
  
  #overwrite devise update function to only require password on email and password updates
  def update
    # required for settings form to submit when password is left blank

    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if update_resource(@user, account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end
end