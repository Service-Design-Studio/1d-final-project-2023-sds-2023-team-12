class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :mobile_phone,:email, :password)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :mobile_phone, :email, :password, :current_password)}
    end
  
end
