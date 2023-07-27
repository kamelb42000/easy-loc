class Candidature < ApplicationRecord
  belongs_to :user
  belongs_to :realty
  has_many_attached :documents
end
