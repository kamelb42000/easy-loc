class Document < ApplicationRecord
  belongs_to :realty

  validates :name, presence: true
end
