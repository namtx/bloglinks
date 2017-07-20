class Provider < ApplicationRecord
  has_many :links, dependent: :destroy
end
