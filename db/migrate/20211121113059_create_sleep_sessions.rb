class CreateSleepSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sleep_sessions do |t|
      t.string :uuid, null: false, index: { unique: true }
      t.belongs_to :user, foreign_key: true
      t.date :date, null: false, index: { unique: true }
      t.datetime :went_to_bed, null: false
      t.datetime :woke_up, null: false
      t.integer :sleep_quality, null: false
      t.float :time_in_bed, null: false
      t.float :movements_per_hour, null: false

      t.timestamps
    end
  end
end
