class ReviewsController < ApplicationController
  load_and_authorize_resource
 
  before_filter :set_review, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_user.role  != ""
      @reviews = Review.all
     else
      @reviews=Review.where(:user_id=>current_user.id)
     end
   
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
     
  end

  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
     if params[:product_id]
            @review.product_id=params[:product_id]
          end
    @review = Review.new(params[:review])
          if params[:product_id]
            @review.product_id=params[:product_id]
          end
    @review.save

    respond_with(@review)
  end

  def update
    @review.update_attributes(params[:review])
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end
end
