class RegistrationsController < Devise::RegistrationsController
    def sign_up_params
        params.require(:user).permit(:email,:password, :password_confirmation, :name, :last_name, :phone)
     
      end
     
      def account_update_params
        params.require(:user).permit(:email,:password, :password_confirmation, :current_password, :name, :last_name, :phone)
      end
     
     
end