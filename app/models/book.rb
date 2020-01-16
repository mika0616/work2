class Book < ApplicationRecord
	# title,bodyの入力必須
	validates :title, presence: true
	validates :body, presence: true
end
