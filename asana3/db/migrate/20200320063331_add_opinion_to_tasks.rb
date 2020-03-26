class AddOpinionToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :opinion, :string
  end
end
