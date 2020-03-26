class ChangeTasksAssigner < ActiveRecord::Migration
  def up
    change_table :tasks do |t|
      t.change :assigner, :string
    end
  end
 
  def down
    change_table :tasks do |t|
      t.change :assigner, :integer
    end
  end
end
