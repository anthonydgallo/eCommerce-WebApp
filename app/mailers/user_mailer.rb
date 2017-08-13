class UserMailer < ApplicationMailer
	default from: "contact_form@ebikeemporium.com"

	def contact_form(email, name, message)
	@message = message
		mail(from: email,
			to: 'anthonydgallo+heroku@gmail.com',
			subject: "New Message from #{name}")
	end

end