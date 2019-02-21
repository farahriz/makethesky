class Scarf < ApplicationRecord
	belongs_to :city
	belongs_to :user

	validates :title, presence: true
	validates :city_id, presence: true
	validates :date_insp, presence: true
    validates :weather_insp, presence: true
    validates :user_id, presence: true

	scope :scarf_name, -> (scarf_name) { where("title ILIKE ?" , "%#{scarf_name}%")   }
    scope :descrip, -> (description) { where("description ILIKE ?", "%#{description}%" ) }
end
