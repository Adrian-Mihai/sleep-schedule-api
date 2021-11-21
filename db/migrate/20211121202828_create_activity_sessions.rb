class CreateActivitySessions < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_sessions do |t|
      t.string :uuid, null: false, index: { unique: true }
      t.belongs_to :user, foreign_key: true
      t.date :date, null: false, index: { unique: true }
      t.float :active_time, null: false
      t.float :calories, null: false

      t.timestamps
    end
  end
end
