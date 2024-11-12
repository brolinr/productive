class CreateMessageBoards < ActiveRecord::Migration[7.2]
  def change
    create_table :message_boards do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title, default: 'Message board'

      t.timestamps
    end
  end
end
