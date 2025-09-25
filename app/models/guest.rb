class Guest < ApplicationRecord
    has_many :reservations, dependent: :destroy

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true
    validates :document_id, presence: true, uniqueness: true
end