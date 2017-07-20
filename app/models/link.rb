class Link < ApplicationRecord
  belongs_to :provider

  delegate :name, to: :provider, prefix: true
end
