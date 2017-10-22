class ProductMailer < ApplicationMailer
	def order_confirmation(email, name, message)
	@message = message
		mail(from: "orders@ebikeemporium.com",
			to: email,
			subject: "Thank You For Your Order!")
	end
end
