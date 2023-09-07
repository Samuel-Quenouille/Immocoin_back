class Property < ApplicationRecord
    validates :title, :description, :price, :city, :zip_code, presence: true
end
