class Event < ApplicationRecord
    belongs_to :user

    validates :name, presence: true
    validates :time, presence: true
    validates :length, presence: true

    validates :length, numericality: { greater_than_or_equal_to: 0 }
end
