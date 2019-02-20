class Testcase < ApplicationRecord
  belongs_to :testmodule
  validates :testmodule_id, presence: true
end
