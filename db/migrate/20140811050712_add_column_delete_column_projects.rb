class AddColumnDeleteColumnProjects < ActiveRecord::Migration
  def up
    add_column :projects, :delete_flag, :boolean, :default => false
    remove_column :projects, :available
  end

  def down
    add_column :projects, :available, :boolean, :default => true
  end
end
