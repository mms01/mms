class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|

     t.string :meeting_id
    t.string :summary
    t.string :detail
    t.integer :owner
    t.date :enddate
    t.integer :sts
    t.string :biko
    t.integer :createdby

      t.timestamps
    end
  end
end
