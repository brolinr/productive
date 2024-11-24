class CreateTaskGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :task_groups do |t|
      t.string :title
      t.string :card_color
      t.references :todo_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
