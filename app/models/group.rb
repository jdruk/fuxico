class Group < ActiveRecord::Base
  belongs_to :user
  
  has_many :user_groups
  has_many :users, :through => :user_groups
  has_many :messages

  def validates_groups	
  	return UserGroup.where().count < 7 ? true : false
  end

end
