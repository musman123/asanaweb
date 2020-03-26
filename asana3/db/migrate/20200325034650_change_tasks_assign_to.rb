class ChangeTasksAssignTo < ActiveRecord::Migration
  def up
    change_table :tasks do |t|
      t.change :assign_to, :string
    end
  end
 
  def down
    change_table :tasks do |t|
      t.change :assign_to, :integer
    end
  end
end
