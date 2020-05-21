class Comment < ApplicationRecord
  belongs_to :photo
  validates :content,presence: true
  validates :owner,presence: true
 
end
