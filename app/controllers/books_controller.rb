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
    @book=Book.new
    @topics=Topic.all
  end

  def create
   
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save

      flash[:notice]= "Libro creado exitosamente!"
      redirect_to books_path

    else
      flash[:alert] = "Falló la cración del libro"
      render :new
    end
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)

      flash[:notice]= "Libro creado exitosamente!"
      redirect_to books_path

    else
      flash[:alert] = "Falló la cración del libro"
      render :new
    end

  end

  def delete
  end


  private

  def book_params
  params.require(:book).permit(:user_id, :title, :city,:editorial, :autor_id) #solo permite estos datos
  
end
end


