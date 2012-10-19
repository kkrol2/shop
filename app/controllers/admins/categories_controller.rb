class Admins::CategoriesController  < Admins::AdminsController








	def new
		@category = Category.new
	end

	def create
		 @category = Category.new(params[:category])
 		 respond_to do |format|
    		if @category.save
      			format.html  { redirect_to('/admins/categories/list',
                	    :notice => 'Category was successfully created.') }
      					format.json  { render :json => @category,
               	     :status => :created, :location => @category }
  			 else
      			format.html  { render :action => "new" }
      			format.json  { render :json => @category.errors,
           	         :status => :unprocessable_entity }
    		end
 		 end
	end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
     @category = Category.find(params[:id])
      if @category.update_attributes(params[:category])
         redirect_to :action => 'show', :id => @category
      else
         render :action => 'edit'
      end
  end

  def list
    @categories = Category.all
  end

   def destroy
      Category.find(params[:id]).destroy
      redirect_to :action => 'list'
   end



  
end