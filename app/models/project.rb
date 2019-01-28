class Project < ApplicationRecord
  has_many :testmodules
  belongs_to :user
end
