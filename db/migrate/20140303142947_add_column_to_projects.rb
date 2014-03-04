class AddColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :manager_id, :string
    add_column :projects, :start_date, :string
    add_column :projects, :end_date, :string
    add_column :projects, :create_user_id, :string
  end
end
