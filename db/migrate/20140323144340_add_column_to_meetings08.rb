class AddColumnToMeetings08 < ActiveRecord::Migration
  def up
    add_column :meetings, :user_id, :integer
  end

  def down
  end
end
