class Candidature < ApplicationRecord
  belongs_to :realty
  has_many :user
  has_many_attached :documents
end
