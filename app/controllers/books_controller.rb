class BooksController < AdminController
  layout 'admin'

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    puts "I am here ****************************"
    if @book.save
      flash[:notice] = "Book #{@book.name} was created successfully"
      redirect_to(:action => 'index')
    else
      flash[:error] = "Something happend"
      render('new')
    end
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id]).destroy
    flash[:notice] = "Book '#{@book.name}' deleted successfully"
    redirect_to(:action => 'index')
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Book #{@book.name} updated successfully"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  private

  def book_params
    params.require(:book).permit(:id,:name,:author,:price,:number_of_pages,:created_at,:updated_at)
  end
end
