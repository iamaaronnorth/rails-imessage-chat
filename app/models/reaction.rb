class Reaction < ApplicationRecord
  belongs_to :message
  
  validates :emoji, presence: true
  validates :sender_name, presence: true
  validates :emoji, uniqueness: { scope: [:message_id, :sender_name] }
end
