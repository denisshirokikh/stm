class Testcase < ApplicationRecord
  belongs_to :testmodule, :inverse_of => :testcases
  belongs_to :testrun
  validates_presence_of :testmodule
  amoeba do
    enable
    prepend :title => "Copy of "
  end


end
