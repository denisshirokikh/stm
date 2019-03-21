class Testmodule < ApplicationRecord
  validates :project_id, presence: true
  belongs_to :project
  has_many :testcases, dependent: :destroy

  amoeba do
    enable
    prepend :title => "Copy of "
  end

end

