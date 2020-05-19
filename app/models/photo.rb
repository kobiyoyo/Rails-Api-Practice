class Photo < ApplicationRecord
	has_many :comments
	validates :title,presence: true
	validates :photo_url_string,presence: true
end
