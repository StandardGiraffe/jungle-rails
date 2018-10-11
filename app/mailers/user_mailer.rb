class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Thanks for your order!  (Order No. #{order.id})")
  end

end
