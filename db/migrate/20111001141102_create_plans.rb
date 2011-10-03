class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :id
      t.string :name
      t.string :interval
      t.string :currency
      t.integer :amount

      t.timestamps
    end
  end
end
