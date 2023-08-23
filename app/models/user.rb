class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :openai_queries, dependent: :destroy
  after_create :send_welcome_email    


  def send_welcome_email
    WelcomeEmailJob.perform_in(30.seconds, self.id)
  end  
end
