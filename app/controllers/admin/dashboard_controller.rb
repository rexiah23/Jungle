class Admin::DashboardController < ApplicationController

  def show
    @all_products_in_db = Product.all
    @all_categories_in_db = Category.all 
  end
end
