class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  layout "admin"

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "商品更新成功"
    else
      render :edit
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "成功新建商品"
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, alert: "商品已被删除"
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
