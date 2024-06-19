class OrderMailer < ApplicationMailer
  def welcome_email
    @order = params[:order]

    mail(to: @order.email, subject: '購入明細')
  end
end
