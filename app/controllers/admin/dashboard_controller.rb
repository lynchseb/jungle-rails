class Admin::DashboardController < Admin::BaseController
  
  def show
    @productCount = Product.all.count
    @categoryCount = Category.all.count
  end
end
