class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  def self.retrieve_user_name comment
    @user=User.find_by(id: comment.user_id)
    return @user.full_name
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :mobile_phone,:email, :password)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :mobile_phone, :email, :password, :current_password)}
    end
  
end
