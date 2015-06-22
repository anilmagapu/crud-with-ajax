
class Ability
  include CanCan::Ability

  def initialize(user)
                       # allow everyone to read everything
    if user && user.role=="admin"
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard  
      
      can :manage, :all # allow access to dashboard
#cannot :manage, Article if user.role == "admin"
       
       elsif user && user.role == "supervisor"
        puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        
        can :manage,  [Review,Category]             # allow superadmins to do anything
        cannot [:edit,:create,:destroy], [Review]

       # cannot :create, [Review]
        can :manage, [Product]
      # elsif user.role? :manager
      #   can :manage, [User, Product]  # allow managers to do anything to products and users
      # elsif user.role? :sales
      #   can :update, Product, :hidden => false  # allow sales to only update visible products
      # end
    elsif user && user.role =""
         can :manage,  [Review] 
         can :read,[Product]
        
         can [:edit] ,[Review]  


    end
   # can :access, :rails_admin  

    #  if  user.role != "admin"

    #        # only allow admin users to access Rails Admin
    #   can :dashboard  
    #    can :read, [Product]
    #   # cannot :edit,[Product]
    #    cannot :edit, [User]
    #   # can :manage, [Review]
    #   # cannot :destroy, [Product,Article]
    #   #  cannot :edit, [Product,Article]

     
    # end



  end
end
 