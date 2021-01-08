class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASS']

  def show
    @productCount = Product.all.count
    @categoryCount = Category.all.count
  end
end
