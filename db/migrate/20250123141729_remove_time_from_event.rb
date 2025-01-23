class RemoveTimeFromEvent < ActiveRecord::Migration[8.0]
  def change
    remove_column :events, :time, :time
  end
end
