class OpenaiQuery < ApplicationRecord
  validates :query, presence: true
  validates :query, length: { minimum: 10 }  
  belongs_to :user  
  followable_behaviour
  # ApplicationRecord.table_name="follows"
end



