class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
