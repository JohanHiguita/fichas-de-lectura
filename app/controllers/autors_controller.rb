class AutorsController < ApplicationController

	def new
		@autor = Autor.new
	end

	def create

		@autor = Autor.create(autor_params)
		# if @autor.save

		# 	flash[:notice]= "Autor creado exitosamente!"
		# 	#redirect_to books_path

		# else
		# 	@topics=Topic.all
		# 	flash[:alert] = "Falló la cración del Autor"
		# 	#render :new
		# end
	end

	def edit
	end

	def update
	end

	private


	def autor_params
  		params.require(:autor).permit(:name1, :name2, :lastname1,:lastname2) #solo permite estos datos
	end
end
