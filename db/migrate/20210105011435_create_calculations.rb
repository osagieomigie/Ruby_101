class CreateCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :calculations do |t|
      t.belongs_to :user 
      t.string :step
      t.timestamps
    end
  end
end
