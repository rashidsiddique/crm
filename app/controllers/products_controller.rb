class ProductsController < AdminsController
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def batch_products    
    @product_batch = Product.new
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
    params.require(:product).permit(:name, :description, :category_ids, :status, :price, 
      :is_recurring, :recurring_type, :recurring_no_of_payments, :recurring_custom_bill_on, 
      :recurring_custom_type, :has_trial, :trial_price, :trial_days, :product_ids => [])
  end

end
