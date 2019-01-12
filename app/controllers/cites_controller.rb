class CitesController < ApplicationController

	def new
		@cite = Cite.new
		@book_id = params[:format] #con este key se recibe el dato pasado
		
	end

	def create
		# 
		@cite = Cite.create(cite_params)

	end

	def cite_params
  		params.require(:cite).permit(:content, :book_id) #solo permite estos datos
	end


end
