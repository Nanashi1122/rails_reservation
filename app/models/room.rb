class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :room_image
    has_many :reservations, dependent: :destroy
    def self.search_by_address(query)
        where('address LIKE ?', "%#{query}%")
    end
end
