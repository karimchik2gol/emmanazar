class OrderYurist < ApplicationRecord
	belongs_to :yurist
	belongs_to :project
	belongs_to :apartment
end
