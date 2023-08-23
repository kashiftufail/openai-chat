class WelcomeEmailJob
  include Sidekiq::Job

  def perform(*args)
    user = User.find(args[0])
    UserNotifierMailer.send_signup_email(user).deliver 
  end
end