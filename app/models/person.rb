class Person < ApplicationRecord
	validates_presence_of :name, :phone
	
	has_one :physical, dependent: :destroy
	has_one :yurist, dependent: :destroy
end
