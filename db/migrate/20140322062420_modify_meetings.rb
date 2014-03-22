class ModifyMeetings < ActiveRecord::Migration
  def up
    remove_column :meetings, :project_id
  end

  def down
    add_column :meetings, :project_id, :string
  end
end
