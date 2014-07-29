class AddAvailableToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :available, :boolean, :default => true
  end
end
