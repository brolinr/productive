class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :message, null: false, foreign_key: true
      t.references :project_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
