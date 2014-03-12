class CreateMinutes < ActiveRecord::Migration
  def change
    create_table :minutes do |t|
      t.string :meeting_id
      t.string :detail

      t.timestamps
    end
  end
end
