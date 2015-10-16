class PagesController < AdminController

  layout 'admin'

  def index
    @book = Book.find(params[:book_id])
    puts "Found book #{@book.name}"
    @pages = @book.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
    @book = Book.find(params[:book_id])
  end

  def new
    @book = Book.find(params[:book_id])
    @new_default_position = @book.pages.count + 1
    @is_edit = params[:is_edit]
  end

  def create
    @all_params = page_params
    @page_images = @all_params[:page_image]
    @all_params.delete(:page_image)

    @assigment_variables = @all_params

    @page_images.each { |page_image|
      @all_params[:page_image] = page_image
      p page_image
      puts "Class is #{page_image.class}"

      @page = Page.new(@all_params)
      @page.book = Book.find(params[:book_id])
      if @page.save
        flash[:notice] = "Page #{@page.position} was added to #{@page.book.name} successfully"
      else
        flash[:error] = "Something happend"
        render('new')
      end

      @all_params[:position] = @all_params[:position].to_i + 1
    }
    puts "BLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    redirect_to(:action => 'index', :book_id => @page.book.id)
    # @assigment_variables[:id] = page_params[:id]
    # @page = Page.new(page_params)
    # @page.book = Book.find(params[:book_id])
    # if @page.save
    #   flash[:notice] = "Page was added to #{@page.book.name} successfully"
    #   redirect_to(:action => 'index', :book_id => @page.book.id)
    # else
    #   flash[:error] = "Something happend"
    #   render('new')
    # end
  end

  def edit
    @page = Page.find(params[:id])
    @max_position = @page.book.pages.count + 1
    @is_edit = params[:is_edit]
  end

  def update
    @page = Page.find(params[:id])
    @page.book = Book.find(params[:book_id])

    puts "Got new position: #{page_params}"
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(:action => 'index', :book_id => @page.book.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id]).destroy
    flash[:notice] = "Page number #{@page.position} deleted successfully from the book '#{@page.book.name}'"
    redirect_to(:action => 'index', :book_id => @page.book.id)
  end

  private

  def page_params
    params.require(:page).permit(:id,:position,:created_at,:updated_at,:is_edit,page_image: [])
  end

end
