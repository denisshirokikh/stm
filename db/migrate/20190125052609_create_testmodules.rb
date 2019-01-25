class CreateTestmodules < ActiveRecord::Migration[5.2]
  def change
    create_table :testmodules do |t|
      t.string :title
      t.string :content
      t.integer :project_id

      t.timestamps
    end
  end
end
