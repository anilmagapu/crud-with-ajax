class User < ActiveRecord::Base
         devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  attr_accessible :email,:password,:confirm_password,:password_confirmation,:remember_me,:role
 has_many :identities
      
 RailsAdmin.config do |config|
        config.model 'User' do
         edit do
          
           
            field :role do
                            
            end
           
          end
          show do
              field :email 

              field :role 
           
          end
      end
    end
  def twitter
    identities.where( :provider => "twitter" ).first
  end

  def twitter_client
    @twitter_client ||= Twitter.client( access_token: twitter.accesstoken )
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

 
end