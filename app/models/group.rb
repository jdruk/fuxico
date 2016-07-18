class Group < ActiveRecord::Base
  belongs_to :user
  
  has_many :user_groups
  has_many :users, :through => :user_groups
  has_many :messages

  validates :validates_groups, acceptance: true
  validates :user_groups, length: { maximum: 7 }

end
