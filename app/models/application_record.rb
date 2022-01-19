class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  validates :phone, format: { with: /\+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/, message: "do not include hyphens" }
end
