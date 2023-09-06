class Property < ApplicationRecord
    belongs_to :user

    validates :title, :description, :price, :city, :zip_code, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }

end
