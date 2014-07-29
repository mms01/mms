class ModifyTodos20140728 < ActiveRecord::Migration
  def change
    change_column :todos, :sts, :string
  end
end
