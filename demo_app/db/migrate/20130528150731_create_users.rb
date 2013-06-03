class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :class_year
      t.string :netid

      t.timestamps
    end
  end
end
