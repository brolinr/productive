# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table(:projects) do |t|
      t.references(:user, null: false, foreign_key: true)
      t.string(:name)
      t.string(:description)
      t.boolean(:pinned, default: false)

      t.timestamps
    end
  end
end
