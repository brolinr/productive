class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :due_date
      t.boolean :complete
      t.references :assignee, polymorphic: true, null: true
      t.references :list, polymorphic: true, null: false
      t.references :group, polymorphic: true, null: true

      t.timestamps
    end
  end
end
