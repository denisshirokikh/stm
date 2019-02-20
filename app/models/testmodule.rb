class Testmodule < ApplicationRecord
  belongs_to :project
  has_many :testcases, dependent: :destroy
  validates :project_id, presence: true
end
