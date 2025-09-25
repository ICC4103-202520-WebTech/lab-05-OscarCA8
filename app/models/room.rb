class Room < ApplicationRecord
    has_many :reservations, dependent: :destroy

    validates :number, presence: true, uniqueness: true
    validates :room_type, :status, presence: true
    validates :status, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end