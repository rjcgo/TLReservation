class AddDescriptionToTestlines < ActiveRecord::Migration
  def change
    add_column :testlines, :description, :text
  end
end
