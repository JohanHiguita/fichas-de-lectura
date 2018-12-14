class BooksController < ApplicationController

  before_action :authenticate_user!

  def index
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
    @notes=@book.notes
    @cites=@book.cites
    @topics=@book.topics
    @autor = "#{@book.autor.name1} #{@book.autor.name2} #{@book.autor.lastname1} #{@book.autor.lastname2}"
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end


  private

def book_params
  params.require(:book).permit(:user_id, :title, :city,:editorial, :autor_id) #solo permite estos datos
  
end
end


