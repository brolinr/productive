class CreateNotifees < ActiveRecord::Migration[7.2]
  def change
    create_table :notifees do |t|
      t.references :notifyable, polymorphic: true, null: false
      t.references :project_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
