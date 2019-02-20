class CreateTestcases < ActiveRecord::Migration[5.2]
  def change
    create_table :testcases do |t|
      t.string :title
      t.text :body
      t.references :testmodule, foreign_key: true

      t.timestamps
    end
  end
end
