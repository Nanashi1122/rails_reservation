class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :room_image
    has_many :reservations, dependent: :destroy
    validates :name, presence: true
    validates :introduction, presence: true
    validates :fee, presence: true, numericality: { greater_than_or_equal_to: 1 }
    validates :area, presence: true
    validates :address, presence: true
    def self.search_by_address(query)
        where('address LIKE ?', "%#{query}%")
    end
end
