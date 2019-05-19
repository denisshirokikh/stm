class Testrun < ApplicationRecord
  validates :project_id, presence: true
  belongs_to :project
end
