class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :account_type, :string
  end
end
