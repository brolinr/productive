class CreateProjectUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :project_users do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :role, default: 0
      t.integer :invite_status, default: 0

      t.timestamps
    end
  end
end
