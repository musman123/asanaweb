class AddDetailsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :assigner, :integer
    add_column :tasks, :assign_to, :integer
    add_column :tasks, :start_date, :date
    add_column :tasks, :submission_date, :date
  end
end
