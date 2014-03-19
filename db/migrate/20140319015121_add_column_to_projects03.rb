class AddColumnToProjects03 < ActiveRecord::Migration
  def change
    add_column :projects, :purpose, :text
    add_column :projects, :sts, :string
    add_column :projects, :attached, :bytea
  end
end
