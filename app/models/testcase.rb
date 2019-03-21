class Testcase < ApplicationRecord
  belongs_to :testmodule, :inverse_of => :testcases
  validates_presence_of :testmodule
  amoeba do
    enable
  end


end
