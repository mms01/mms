class ModifyMeetings02 < ActiveRecord::Migration
  def up
    remove_column :meetings, :host_user_id
  end

  def down
    add_column :meetings, :host_user_id, :string
  end
end
