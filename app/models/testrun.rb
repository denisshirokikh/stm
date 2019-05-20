class Testrun < ApplicationRecord
  validates :project_id, presence: true
  validates_presence_of :title
  validates_presence_of :testcases
  belongs_to :project
  has_many :testcases
  # has_many :reports
end
