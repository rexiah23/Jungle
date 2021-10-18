<<<<<<< HEAD
class Admin::Categories < ApplicationController
=======
class Admin::CategoriesController < ApplicationController
>>>>>>> feature/admin-categories
  http_basic_authenticate_with name: "Jungle", password: "book"
  before_action :set_post, only: [:destroy]
  
  def index
<<<<<<< HEAD
    @categories = Categories.order(id: :desc).all
  end

  def new
    @cateogries = Categories.new
  end

  def create
    @categories = Categories.new(product_params)

    if @categories.save
      redirect_to [:admin, :products], notice: 'Categories created!'
=======
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
>>>>>>> feature/admin-categories
    else
      render :new
    end
  end

  def destroy
<<<<<<< HEAD
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
=======
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

  private 

  def category_params
    params.require(:category).permit(
      :name
>>>>>>> feature/admin-categories
    )
  end

end
