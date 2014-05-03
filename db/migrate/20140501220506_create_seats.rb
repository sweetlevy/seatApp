class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :type
      t.integer :number

      t.timestamps
    end
  end
end
