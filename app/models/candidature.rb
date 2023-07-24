class Candidature < ApplicationRecord
  belongs_to :realty
  has_many :user
end
