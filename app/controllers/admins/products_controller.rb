class Admins::ProductsController  < Admins::AdminsController


	def new
		@product = Product.new
	end

	def create
		 @product = Product.new(params[:product])
 		 respond_to do |format|
    		if @product.save
      			format.html  { redirect_to('/admins/products/list',
                	    :notice => 'Product was successfully created.') }
      					format.json  { render :json => @product,
               	     :status => :created, :location => @product }
  			 else
      			format.html  { render :action => "new" }
      			format.json  { render :json => @product.errors,
           	         :status => :unprocessable_entity }
    		end
 		 end
	end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
     @product = Product.find(params[:id])
      if @product.update_attributes(params[:product])
         redirect_to :action => 'show', :id => @product
      else
         render :action => 'edit'
      end
  end

  def list
    @products = Product.all
  end

   def destroy
      Product.find(params[:id]).destroy
      redirect_to :action => 'list'
   end



  
end