class AddColumnToMeetings05 < ActiveRecord::Migration
  def up
    add_column :meetings, :project_id, :integer
  end

  def down
  end
end
