class Admin::Categories < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  before_action :set_post, only: [:destroy]
  
  def index
    @categories = Categories.order(id: :desc).all
  end

  def new
    @cateogries = Categories.new
  end

  def create
    @categories = Categories.new(product_params)

    if @categories.save
      redirect_to [:admin, :products], notice: 'Categories created!'
    else
      render :new
    end
  end

  def destroy
    @categories = Categories.find params[:id]
    @categories.destroy
    redirect_to [:admin, :products], notice: 'Categories deleted!'
  end

  private

  def categories_params
    params.require(:categories).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
