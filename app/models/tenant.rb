class Tenant < ApplicationRecord
  belongs_to :realty
  belongs_to :user
end
