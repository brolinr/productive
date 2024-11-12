class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.string :title
      t.boolean :draft, default: true
      t.references :room, polymorphic: true, null: false
      t.references :sender, polymorphic: true, null: false

      t.timestamps
    end
  end
end
