class AddCustomerRefToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :customer_ref, :string
  end
end
