class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?


   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_in){ |u| u.permit(:email, :password) }
     devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:name, :username, :email, :password, :password_confirmation)}
     devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:name, :username, :email, :password, :password_confirmation) }
   end

   def update
     self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
     if resource.update_with_password(user_params)
       if is_navigational_format?
         flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ? :update_needs_confirmation : :updated
         set_flash_message :notice, flash_key
       end
       sign_in resource_name, resource, :bypass => true
       respond_with resource, :location => after_update_path_for(resource)
     else
       clean_up_passwords resource
       respond_with resource
     end
   end

   def user_params
     params.require(:user).permit(:email, :password, :current_password, :password_confirmation, :name, :username)
   end




  #
  # private
  #   def sign_up_params
  #     params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  #   end
  #
  #   def account_update_params
  #     params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :current_password)
  #   end
  #
  # protected
  #
  #   def configure_devise_permitted_parameters
  #     permitted_params = [:username, :name, :email, :password, :password_confirmation]
  #
  #     if params[:action] == 'update'
  #       devise_parameter_sanitizer.for(:account_update) {
  #         |u| u.permit(permitted_params << :current_password)
  #       }
  #     elsif params[:action] == 'create'
  #       devise_parameter_sanitizer.for(:sign_up) {
  #         |u| u.permit(permitted_params)
  #       }
  #     end
  #   end

    # def configure_permitted_parameters
    #   devise_parameter_sanitizer.for(:sign_up) do |u|
    #     u.permit(:email, :username, :name, :password, :password_confirmation)
    #   end
    # end




  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
