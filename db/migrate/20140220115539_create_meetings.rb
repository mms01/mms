class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :project_id
      t.string :title
      t.string :purpose
      t.string :host_user_id

      t.timestamps
    end
  end
end
