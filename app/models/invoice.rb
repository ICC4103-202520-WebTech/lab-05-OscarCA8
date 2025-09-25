class Invoice < ApplicationRecord
    belongs_to :reservation

    validates :nights_subtotal, :services_subtotal, :tax, :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :issued_at, presence: true  
    validates :status, presence: true
end