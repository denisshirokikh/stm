class AddTestcasesTestrun < ActiveRecord::Migration[5.2]
  def change
    add_column :testcases, :testrun_id, :integer
  end
end
