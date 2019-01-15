class BooksController < ApplicationController

  before_action :authenticate_user!

  def index
    @books=Book.where(user_id: current_user.id)
  end

  def show
    @book=Book.find(params[:id])
    @cites=@book.cites
    @topics=@book.topics
    @autor = "#{@book.autor.name1} #{@book.autor.name2} #{@book.autor.lastname1} #{@book.autor.lastname2}"
  end

  def new

    @book=Book.new
    @cite =Cite.new
    @topics=Topic.all
    @topics=Topic.where(user_id: current_user.id)
  
  end

  def edit
    @book=Book.find(params[:id])
    #@topics=Topic.all
    @topics=Topic.where(user_id: current_user.id)

  end

  def create
    @book = Book.new(book_params)

    insert_cite
    @book.user = current_user
    if params[:topic_ids]
      params[:topic_ids].each do |topic_id|

        topic = Topic.find(topic_id)
        @book.topics << topic
      end
    end
    if @book.save
      flash[:notice]= "¡Se ha creado el libro #{@book.title} exitosamente!"
      redirect_to book_path(@book)

    else
      @topics=Topic.all
      flash[:alert] = "Error al crear el libro"
      render :new
    end
  end

  
  def update
    @book=Book.find(params[:id])
    insert_cite
    @book.topics.clear #limpiar asociaciones para actualizar
    if params[:topic_ids]
      
      new_ids = params[:topic_ids].values #se obtienen solo los valores 
      new_ids = new_ids.map(&:to_i) #a enteros
      #se actualizan los nuevos temas
      new_ids.each do |topic_id| 
        topic = Topic.find(topic_id)
        @book.topics << topic
      end
    end
    if @book.update(book_params)

      flash[:notice]= "¡Se ha editado el libro '#{@book.title.upcase}' exitosamente!"
      redirect_to book_path(@book)

    else
      flash[:alert] = "Falló la modificación del libro"
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice]="El libro fue eliminado exitosamente"
    redirect_to books_path
  end


  private

  def book_params
  params.require(:book).permit(:user_id, :title, :city,:editorial, :notes, :autor_id, :topic_ids) #solo permite estos datos

  end

  def insert_cite
    cite=params['book']['cites'] #cita recibida en el hash params
    unless cite.to_s.strip.empty? # => se agrega si no está vacia o solo es espacios en blanco
      @cite = Cite.create(content: cite)
      @book.cites << @cite
    end

  end

end




