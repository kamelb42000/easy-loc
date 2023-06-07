class Document < ApplicationRecord
  belongs_to :realty
  has_one_attached :photo

  validates :name, presence: true
end
