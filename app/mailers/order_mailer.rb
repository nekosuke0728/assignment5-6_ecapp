class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirmation_of_order.subject
  #
  def confirmation_of_order(user,order)
    @user = user
    @order = order

    mail to: @user.email,
         bcc: 'admin1@sample.com',
         subject: '注文確定メール'
  end
end
