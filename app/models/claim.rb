class Claim < ApplicationRecord
  belongs_to :realty

  validates :title, :content, presence: true
end
