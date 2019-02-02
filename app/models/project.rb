class Project < ApplicationRecord
  has_many :testmodules, dependent: :destroy
  belongs_to :user
end
