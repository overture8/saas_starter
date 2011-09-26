class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
  end
end
