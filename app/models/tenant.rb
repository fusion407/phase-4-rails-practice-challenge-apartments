class Tenant < ApplicationRecord
    has_many :apartments
    has_many :leases

    validates :name, presence: true
    validates :age, numericality: { greater_than: 18 }
end
