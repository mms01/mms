class AddColumnMeetings < ActiveRecord::Migration
  def up
    add_column :meetings, :place, :string
    add_column :meetings, :update_date, :timestamp
    add_column :meetings, :available, :boolean
    change_column :meetings, :purpose, :text
  end

  def down
    delete_column :meetings, :date, :string
    delete_column :meetings, :start_time, :string
    delete_column :meetings, :end_time, :string
    change_column :meetings, :purpose, :string
  end
end
