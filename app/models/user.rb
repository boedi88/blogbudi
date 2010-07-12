class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :login, :email, :password, :password_confirmation
  
  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles
  has_many :posts
  has_attached_file :photo, :styles => { :thumb => "100x100#", :small  => "150x150>" },
		:url  => "/assets/users/:id/:style/:basename.:extension",
                :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  attr_accessible :photo
  
  # returns true if the user has the "admin" role, false if not.
  def admin?
    has_role?("admin")
  end

  # returns true if the specified role is associated with the user.
  #  
  #  user.has_role("admin")
  def has_role?(role)
    self.roles.count(:conditions => ["name = ?", role]) > 0
  end
  
  # Adds a role to the user by name
  #
  # user.add_role("mentor")
  def add_role(role)
    return if self.has_role?(role)
    self.roles << Role.find_by_name(role)
  end
end
