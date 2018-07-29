class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :price
      t.string :period

      t.timestamps
    end
  end
end
