class CreateShifts < ActiveRecord::Migration[7.1]
  def change
    create_table :shifts do |t|
      t.string :title
      t.text :detail

      t.timestamps
    end
  end
end
