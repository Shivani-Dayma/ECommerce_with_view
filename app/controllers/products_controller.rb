class ProductsController < ApplicationController
  before_action :set_user, :authorize_request
  # before_action :authorize_request

  def index
    @product=@user.products.all
  end

  def edit
  end

  def new
    @user=User.find(params[:user_id])
    @product=@user.products.new
  end
   
  def create
  # debugger
  @product = @user.products.new(product_params)
  if @product.save
    render 'show'
  else
    render :new
  end
  end

  def show
    if @product.present?
      render 'show'
    else
      render 'index'
    end
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :product_image)
  end
end




