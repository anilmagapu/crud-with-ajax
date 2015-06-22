class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  attr_accessible :description, :rating, :title,:product_id,:user_id
			 RailsAdmin.config do |config|
			  config.model 'Review' do
			   edit do
                        field :title do
                            read_only true
			      end
			      field :description do
                            read_only true
			      end
			      field :rating do
                            read_only true
			      end
			      field :product do
                            read_only true
			      end
			    end
			end
		end
end
