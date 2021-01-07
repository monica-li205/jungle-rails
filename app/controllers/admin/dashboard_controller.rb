class Admin::DashboardController < ApplicationController
  def show
    @num_of_products = Product.count(:all)
    @num_of_categories = Category.count(:all)
  end
end
