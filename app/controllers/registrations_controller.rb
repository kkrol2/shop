class RegistrationsController < Devise::RegistrationsController

#before_filter :prevent_sign_up

private
    def prevent_sign_up
        redirect_to new_admin_session_path and return
    end
endsa