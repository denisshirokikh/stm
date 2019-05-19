class Project < ApplicationRecord
  has_many :testmodules, dependent: :destroy
  has_many :testruns, dependent: :destroy
  belongs_to :user
end
