class Message < ApplicationRecord
  belongs_to :chat
  has_many :reactions, dependent: :destroy
  
  validates :content, presence: true
  validates :sender_name, presence: true
  
  def grouped_reactions
    reactions.group(:emoji).count
  end
end
