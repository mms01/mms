class AddColumnToMeetings06 < ActiveRecord::Migration
  def up
    add_column :meetings, :update_user_id, :string
  end

  def down
  end
end
