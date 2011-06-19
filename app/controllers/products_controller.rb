class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml
  
  before_filter :authorize, :except => [:index]
  
  helper_method :sort_column, :sort_direction
  
  def index
    #@products = Product.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
    @products = Product.joins('LEFT OUTER JOIN manufacturers ON manufacturers.id = products.manufacturer_id
                               LEFT OUTER JOIN product_categories ON product_categories.id = products.product_category_id').search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
    
    #Default product to active
    @product.active = true

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  private 
  
  def sort_column
    if params[:sort] == 'manufacturers.name' or params[:sort] == 'category'
      return params[:sort]
    else
  
      return Product.column_names.include?(params[:sort]) ? params[:sort] : "number"
       
    end
  end
  
  def sort_direction
    puts "Sort Direction ----------------------------------------------> #{%w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'}"
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
