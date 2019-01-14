class UserNotifierMailer < ApplicationMailer
	default from: "fichas-lectura@app.com"

	def welcome_email(user)
		@user = user
		@subject = "Se ha registrado en fichas-lectura"
		mail(to: @user.email, subject: @subject)
	end

	def new_user_notification(user)
		@user = user
		@subject = "Fichas lectura: Alguien ha creado un usuario"
		mail(to: "higuitajohan@gmail.com", subject: @subject)
		
	end
end
