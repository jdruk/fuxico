class Theme < ActiveRecord::Base
	
	validates :validate_parents,acceptance: true

	has_many :rooms

	belongs_to :father , :class_name => 'Theme', :foreign_key => 'father'


	def list_parent
		fathers = Array.new
		f = self
		while f
			fathers << f
			f = f.father	
		end
		return fathers
	end

	def validate_parents
		return self.list_parent.count <= 8 ? true : false
	end

end
