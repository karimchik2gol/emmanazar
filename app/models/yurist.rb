class Yurist < ApplicationRecord
	validates_presence_of :status
	
	belongs_to :person
	has_many :order_yurists, dependent: :destroy

	def name
		person.name
	end
end
