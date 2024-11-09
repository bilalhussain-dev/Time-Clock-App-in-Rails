class CreateTimeLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :time_logs do |t|
      t.references :shift_assignment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps
    end
  end
end






