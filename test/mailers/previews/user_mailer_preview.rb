# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def welcome_email
        UserMailer.with(user: User.first, user_info: UserInfo.first).welcome_email
    end
end
