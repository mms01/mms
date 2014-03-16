class AddColumnMeetings02 < ActiveRecord::Migration
  def up
    remove_column :meetings, :date
    remove_column :meetings, :start_time
    remove_column :meetings, :end_time
  end

  def down
    add_column :meetings, :date, :string
    add_column :meetings, :start_time, :string
    add_column :meetings, :end_time, :string
  end
end
