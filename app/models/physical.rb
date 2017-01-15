class Physical < ApplicationRecord
	validates :passport, :card_number, :born_date, presence: true

	belongs_to :person
	has_many :orders, dependent: :destroy

	def name
		person.name
	end
end
