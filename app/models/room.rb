class Room < ActiveRecord::Base
  belongs_to :theme

  has_many :messages

  validates :theme, presence: true
  validates :validate_rooms,acceptance: true

  def validates_rooms	
  	return Room.where(theme: self.theme).count < 7 ? true : false
  end
end
