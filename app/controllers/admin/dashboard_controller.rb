class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  
  def show
    @product_num = Product.sum(:quantity)
    @category_num = Category.count
  end
end
