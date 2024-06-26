# frozen_string_literal: true

class Admin::StocksController < AdminController
  before_action :set_stock, only: %i[show edit update destroy]
  before_action :set_product, only: %i[index show new create edit update destroy]

  # GET /stocks or /stocks.json
  def index
    @stocks = @product.stocks
  end

  # GET /stocks/1 or /stocks/1.json
  def show; end

  # GET /stocks/new
  def new
    @stock = @product.stocks.build
  end

  # GET /stocks/1/edit
  def edit; end

  # POST /stocks or /stocks.json
  def create
    @stock = @product.stocks.build(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to admin_product_stock_url(@product, @stock), notice: "Stock was successfully created." }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1 or /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to admin_product_stock_url(@product, @stock), notice: "Stock was successfully updated." }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1 or /stocks/1.json
  def destroy
    @stock.destroy!

    respond_to do |format|
      format.html { redirect_to admin_product_stocks_url, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:size, :amount)
    end
end
