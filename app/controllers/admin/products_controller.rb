# frozen_string_literal: true

# controller to set CRUD to create products in admin dashboard
class Admin::ProductsController < AdminController
  before_action :set_admin_product, only: %i[show edit update destroy]

  # GET /admin/products or /admin/products.json
  def index
    if params[:query]
      @query = params[:query]
      result = ::SearchService.new(::Product, @query).call

      @pagy, @admin_products = pagy(result)
    else
      @pagy, @admin_products = pagy(Product.includes(:category, :images_attachments, :images_blobs))
    end
  end

  # GET /admin/products/1 or /admin/products/1.json
  def show; end

  # GET /admin/products/new
  def new
    @admin_product = Product.new
  end

  # GET /admin/products/1/edit
  def edit; end

  # POST /admin/products or /admin/products.json
  def create
    @admin_product = Product.new(admin_product_params)

    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_product_url(@admin_product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1 or /admin/products/1.json
  def update
    respond_to do |format|
      if @admin_product.update(admin_product_params)
        attach_images(params, @admin_product)

        format.html { redirect_to admin_product_url(@admin_product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1 or /admin/products/1.json
  def destroy
    @admin_product.destroy!

    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_product
    @admin_product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def admin_product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :active)
  end

  def attach_images(ctrl_params, record)
    return if ctrl_params[:product][:images].reject(&:blank?).empty?

    ctrl_params[:product][:images].each do |image|
      record.images.attach(image)
    end
  end
end
