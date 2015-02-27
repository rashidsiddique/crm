class ProductsController < AdminsController
  
  protect_from_forgery except: [:validate_batch]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def batch_products
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

  def add_batch
    @no_of_forms = batch_param.present? ? batch_param.to_i : 1
    respond_to do |format|
      format.js
    end
  end


  def validate_batch
    product_response = {message: true} 
    params[:products].each do |product| 
      @batch = Product.new(product_params(product.last['product']))
      if @batch.valid?
        product_response.push(message: true)
      else
        product_response.push(message: false)
      end    
   end
    respond_to do |format|   
      format.json { render json: {:success => false, :message => "products not created"} }
    end
  end
    # params[:products].each do |key| 
    #   key.last["product"].each do |key,value|
    #     byebug
    #     if value.present?
    #       respond_to do |format|
    #         format.json { render json: "success" }
    #       end
    #     else
    #       render json: nil
    #     end  
    #   end  
    # end   
    # respond_to do |format|
    #   format.json
    # end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_ids, :status, :price, 
      :is_recurring, :recurring_type, :recurring_no_of_payments, :recurring_custom_bill_on, 
      :recurring_custom_type, :has_trial, :trial_price, :trial_days, :product_ids => [])
  end

  def batch_param
    params[:add_batch_products][:no_of_forms] 
  end

  def product_params(params)
    ac_params = ActionController::Parameters.new(params)
    ac_params.permit(:name, :description, :price, :category_ids, :status, :is_recurring, :recurring_type, :recurring_custom_bill_on, :recurring_custom_type, :recurring_no_of_payments, :has_trial, :trial_price, :trial_days)
  end

end
