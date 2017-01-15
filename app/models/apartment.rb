class Apartment < ApplicationRecord
	belongs_to :project
	has_many :order_yurists, dependent: :destroy
	has_many :orders, dependent: :destroy

	validates_presence_of :apartment_type, :general_square, :living_square, :floor, :room_count, :price, :num
	validates_numericality_of :general_square, :living_square, :floor, :room_count, :price, :num, greater_than: 0

	class << self
		def all_type
			["Двухэтажная", "Ещё что-то"]
		end
	end
end
