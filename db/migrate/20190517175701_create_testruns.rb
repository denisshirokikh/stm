class CreateTestruns < ActiveRecord::Migration[5.2]
  def change
    create_table :testruns do |t|
      t.string :title
      t.text :body
      t.boolean :completed
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
