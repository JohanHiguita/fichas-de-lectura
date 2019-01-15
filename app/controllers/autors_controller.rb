class AutorsController < ApplicationController


	before_action :authenticate_user!

	def new
		@autor = Autor.new
	end

	def create


		@autor = Autor.new(autor_params)
		
		@autor.user = current_user
		if @autor.save

		# 	flash[:notice]= "Autor creado exitosamente!"
		# 	#redirect_to books_path

		else
		# 	@topics=Topic.all
		# 	flash[:alert] = "Falló la cración del Autor"
		# 	#render :new
		end
	end

	def edit
	end

	def update
	end

	private


	def autor_params
  		params.require(:autor).permit(:user_id, :name1, :name2, :lastname1,:lastname2) #solo permite estos datos
	end
end
