class OrderMailer < ActionMailer::Base
  default from: "from@example.com"

  def order_confirmed(order)
    @order = order
    mail(to: @order.email, subject: "Your Tiarazon Order")
  end

end
