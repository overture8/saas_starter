class AddPlanToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :plan, :string
  end
end
