class AddColumnToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :date, :string
    add_column :meetings, :start_time, :string
    add_column :meetings, :end_time, :string
    add_column :meetings, :create_user_id, :string
  end
end
