class ProductsController < AdminsController
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create  
    @product = Product.new(product_params)
 
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end

  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :description,:status, :price, 
      :is_recurring, :recurring_type, :recurring_no_of_payments, :has_trial,
      :trial_price, :trial_days, :product_categories => [])
  end

end
