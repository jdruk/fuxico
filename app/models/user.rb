class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :user_groups
  has_many :groups, :through => :user_groups

  has_many :my_groups, :class_name => 'Group'

  has_many :messages

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
end
