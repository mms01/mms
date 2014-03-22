class AddColumnToMeetings04 < ActiveRecord::Migration
  def up
    add_column :meetings, :status, :string
  end

  def down
  end
end
