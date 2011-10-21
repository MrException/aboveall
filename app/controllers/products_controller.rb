class ProductsController < SecureController
  def index
  end

  def show
    @products = Product.all
  end

  def new
  end

  def edit
  end

  def create
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    if @product.update_attributes(params[:product])
      redirect_to @product, notice: 'Product was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @product.destroy

    redirect_to products_url 
  end
end
