class Order < ApplicationRecord
	belongs_to :apartment
	belongs_to :physical
	belongs_to :broker
end
