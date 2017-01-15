class Broker < ApplicationRecord
	validates_presence_of :name, :education, :experience, :experience_in_firm, :rating, :percent_for_service
	validates_numericality_of :experience, :experience_in_firm, :rating, :percent_for_service, greater_than: 0

	has_many :orders, dependent: :destroy
end
