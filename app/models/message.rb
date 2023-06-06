class Message < ApplicationRecord
  belongs_to :realty
  belongs_to :user
  validates :content, presence: true
end
