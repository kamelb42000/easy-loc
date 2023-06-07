class Claim < ApplicationRecord
  belongs_to :realty
  validates :title, :content, presence: true
  has_one_attached :photo
end
