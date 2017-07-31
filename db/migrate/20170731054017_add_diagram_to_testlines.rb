class AddDiagramToTestlines < ActiveRecord::Migration
  def change
    add_column :testlines, :diagram, :string
  end
end
