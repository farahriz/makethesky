class Scarf < ApplicationRecord
	belongs_to :city
	belongs_to :user

	scope :scarf_name, -> (scarf_name) { where("title ILIKE ?" , "%#{scarf_name}%")   }
    scope :descrip, -> (description) { where("description ILIKE ?", "%#{description}%" ) }
end
