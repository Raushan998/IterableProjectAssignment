class ApplicationController < ActionController::Base
    # validating the user
    def validate_user
        if current_user.blank?
            redirect_to new_user_registration_path
        end
    end
end
