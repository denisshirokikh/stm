class Testmodule < ApplicationRecord
  belongs_to :project
  validates :project_id, presence: true
end
