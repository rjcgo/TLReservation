class AddFieldsToTestlines < ActiveRecord::Migration
  def change
    add_column :testlines, :ip_address, :string
    add_column :testlines, :port_number, :integer
    add_column :testlines, :isMaintenance, :boolean, :default => false
  end
end
