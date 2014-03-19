class ModifyProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :start_date
    remove_column :projects, :end_date
  end

  def down
    add_column :projects, :start_date, :string
    add_column :projects, :end_date, :string
  end
end
