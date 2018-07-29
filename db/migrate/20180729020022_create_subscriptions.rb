class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :customer, foreign_key: true
      t.references :plan, foreign_key: true
      t.string :plan_name
      t.string :plan_price
      t.string :plan_period
      t.date :subscribe_date
      t.date :expiration_date
      t.string :shipping_address
      t.string :payment_token

      t.timestamps
    end
  end
end
