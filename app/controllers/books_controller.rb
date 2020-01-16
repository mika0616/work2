class BooksController < ApplicationController
  def index
    @books =Book.all
    @book =Book.new
  end

  def create
	@book =Book.new(book_params)
	if @book.save
		redirect_to book_path(@book.id), notice:'Book was successfully created.'
	else
		# renderすると@booksの準備がなくなってしまうため、再度モデルからデータを引っ張ってこなければならない。
    	@books =Book.all
		render action: :index
	end
	# redirect_to books_path(book)でもよいidは省略できる
  end

  def show
  	@book =Book.find(params[:id])
  end

  def edit
  	@book =Book.find(params[:id])
  end

  def update
  	@book =Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to book_path(@book.id), notice:'Book was successfully created.'
  	else
  		render action: :edit
  	end
  end

  def destroy
  	book =Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  # ストロングパラメータ
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
