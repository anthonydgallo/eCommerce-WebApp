class ProductMailer < ApplicationMailer
	default from: "orders@ebikeemporium.com"

	def order_confirmation(email, name, message)
	@message = message
		mail(to: email,
			subject: "Thank You For Your Order!")
	end

end