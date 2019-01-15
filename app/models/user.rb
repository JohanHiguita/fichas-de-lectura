class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :autors, dependent: :destroy
  has_many :topics, dependent: :destroy
  after_create :send_mails

  def send_mails
  	#Correos al crear un nuevo usuario
    UserNotifierMailer.welcome_email(self).deliver_now #Bienvenida al usuario
    UserNotifierMailer.new_user_notification(self).deliver_now #notificación a higuitajohan@gmail.com
  end
end
