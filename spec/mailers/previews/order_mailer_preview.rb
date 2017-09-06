# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/confirmation_of_order
  def confirmation_of_order
    OrderMailerMailer.confirmation_of_order
  end

end
