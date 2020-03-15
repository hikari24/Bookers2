class Book < ApplicationRecord

	belongs_to :user

	validates :book, presence: true
	validates :body, presence: true
end
