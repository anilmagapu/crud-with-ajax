
# class Identity < ActiveRecord::Base
# 	 attr_accessible :uid,:provider
#   belongs_to :user
#   validates_presence_of :uid, :provider
#   validates_uniqueness_of :uid, :scope => :provider

#   def self.find_for_oauth(auth)
#   	puts "111111111111111111111111111111"
#   	puts  auth.provider
#   	puts "111111111111111111111111111111"
#   	identity = where(:provider => "#{auth.provider}",:uid => "#{auth.uid}").first;
#   	#find(provider: auth.provider, uid: auth.uid)
#     identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
#     identity

#     # find_by(uid: auth.uid, provider: auth.provider)
#   end
# end
class Identity < ActiveRecord::Base
  belongs_to :user
    attr_accessible :uid,:provider,:email,:name
   
  validates_presence_of :uid, :provider,:email
  validates_uniqueness_of :uid, :scope => :provider
    
  def self.find_for_oauth(auth)
puts"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    puts auth.inspect
puts"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"    
    identity = Identity.where(:provider=> auth.provider, :uid=> auth.uid).first
    identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
  #  identity.accesstoken = auth.credentials.token
    #identity.refreshtoken = auth.credentials.refresh_token
    identity.name = auth.info.name
    if auth.info.email.blank?
    identity.email=auth.info.name+"@#{auth.provider}.com"
    else
    identity.email = auth.info.email
    end
    #identity.nickname = auth.info.nickname
    #identity.image = auth.info.image
    #identity.phone = auth.info.phone
    #identity.urls = (auth.info.urls || "").to_json
    identity.save
    identity
  end
end