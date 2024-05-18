class BorrowsController < ApplicationController
  before_action :set_borrow, only: %i[show update destroy]

  # GET /borrows
  # GET /borrows.json
  def index
    @borrows = Borrow.all
  end

  # GET /borrows/1
  # GET /borrows/1.json
  def show; end

  # POST /borrows
  # POST /borrows.json
  def create
    @borrow = Borrow.new(borrow_params)

    if @borrow.save
      render :show, status: :created, location: @borrow
    else
      render json: @borrow.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /borrows/1
  # PATCH/PUT /borrows/1.json
  def update
    if @borrow.update(borrow_params)
      render :show, status: :ok, location: @borrow
    else
      render json: @borrow.errors, status: :unprocessable_entity
    end
  end

  def return_book
    if @borrow.update(borrow_params)
      render :show, status: :ok, location: @borrow
    else
      render json: @borrow.errors, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /borrows/1
  # PATCH/PUT /borrows/1.json

  def mark_returned
    if @borrow.update({ status: false })
      render :show, status: :ok, location: @borrow
    else
      render json: @borrow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /borrows/1
  # DELETE /borrows/1.json
  def destroy
    @borrow.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_borrow
    @borrow = Borrow.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def borrow_params
    params.require(:borrow).permit(:start_date, :end_date, :status, :user_id, :book_id)
  end
end
