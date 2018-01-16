class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @categories = Category.all.order('name asc')
  end

  # GET /books/1/edit
  def edit
    @categories = Category.all.order('name asc')
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @categories = Category.all.order('name asc')
    respond_to do |format|
      if @book.save
        format.html { redirect_to books_url, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        @categories = Category.all.order('name asc')
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    params[:book][:category_ids] = nil if params[:book][:category_ids].nil?
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_url, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        @categories = Category.all.order('name asc')
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def sorted
    order_choice = params[:order] || 'asc'
    column_name = params[:column] || 'name'
    @books = Book.all.order("#{column_name} #{order_choice}")
    render 'index'
  end

  def search_result
    term = params[:criteria]
    column_name = params[:column] || 'name'
    @books = Book.search_by_name(column_name, term) if term && column_name
    render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      #params.fetch(:book, {:name, :categories })
      params.require(:book).permit(:name, :description, :author_name, :price, :edition, :published_date, category_ids: [])
    end
end
