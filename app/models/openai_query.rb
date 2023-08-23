class OpenaiQuery < ApplicationRecord
  validates :query, presence: true
  validates :query, length: { minimum: 10 }  
  belongs_to :user  
end
