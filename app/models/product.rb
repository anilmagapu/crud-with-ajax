class Product < ActiveRecord::Base
	has_many :reviews
	belongs_to :category
	 validates :image,:name,:description,:category_id, presence: true
  attr_accessible :description, :name,:category_id
   attr_accessible :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

 



end
