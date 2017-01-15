class Project < ApplicationRecord
	belongs_to :zabydovnuk
	has_many :order_yurist, dependent: :destroy
	has_many :apartments, dependent: :destroy

	after_commit :change_projects_count
	after_update :change_projects_count_update

	private
	def change_projects_count_update
		zabydovnuk = Zabydovnuk.find(zabydovnuk_id_was)
		change_projects_count(zabydovnuk)
	end

	def change_projects_count(zabd = zabydovnuk)
		zabd.update_attributes(:projects_count => zabd.projects.count)
	end
end
