class UserMailer < ApplicationMailer

  def notification_mail(user, remarks)
    @user = user
    @remark = remarks
    mail(to: @user.email, subject: "You have recieved new notification!") do |format|
      format.html{ render 'user_mailer/user_mail'}
    end
  end

end
