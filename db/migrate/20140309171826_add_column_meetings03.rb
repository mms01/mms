class AddColumnMeetings03 < ActiveRecord::Migration
  def up
    add_column :meetings, :meeting_date, :date
    add_column :meetings, :start_time, :time
    add_column :meetings, :end_time, :time
  end

  def down
  end
end
