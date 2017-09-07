class RemoveIpAddressAndPortNumberFromTestlines < ActiveRecord::Migration
  def change
    remove_column :testlines, :ip_address, :string
    remove_column :testlines, :port_number, :integer
  end
end
