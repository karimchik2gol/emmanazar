class Zabydovnuk < ApplicationRecord
	has_many :projects, dependent: :destroy
end
