class Reservation < ApplicationRecord
  belongs_to :guest
  belongs_to :room
  has_many :service_usages
  has_one :invoice

  validates :code, presence: true, uniqueness: true
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :status, presence: true
  validates :adults, presence: true, numericality: { greater_than_or_equal_to: 0 }  
  validates :children, presence: true, numericality: { greater_than_or_equal_to: 0 }
end