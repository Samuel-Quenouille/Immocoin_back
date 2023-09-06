class User < ApplicationRecord

    has_many :properties

    validates :email, 
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: "Entrez un email valide" }

    devise :database_authenticatable, :registerable,
    :jwt_authenticatable,
    jwt_revocation_strategy: JwtDenylist
end
