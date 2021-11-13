class CreateDices < ActiveRecord::Migration[6.1]
  def change
    create_table :dices do |t|
      t.integer :dice_number
      t.integer :dice_sides

      t.timestamps
    end
  end
end
