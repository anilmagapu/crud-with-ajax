class CategoriesController < ApplicationController
   load_and_authorize_resource
  before_filter :set_category, only: [:show, :edit, :update, :destroy]
   layout 'categories'
  

  #respond_to :html
respond_to :html, :js
  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
     
  end

  def edit
  end

   def create
     @a=params[:category][:name]
    if !@a.blank?
    @category = Category.new(params[:category])  
    @category.save
    @categories = Category.all
    respond_with(@categories)
    #respond_with(@categories)
  else
      render :create
  end
  end















  def update
     @a=params[:category][:name]
          if !@a.blank?
          @category.update_attributes(params[:category])
          @c_id=@category.id
          @c_name=@category.name
          respond_with(@category)
          else
            render :update
          end
  end

  def destroy
    @c_id=@category.id
    @category.destroy
   
   respond_with(@category)
  end
  def pro
    @products=Product.where(:category_id=>params[:cat_id])
     @products.inspect and return
    render :partial => 'pro'
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
end
