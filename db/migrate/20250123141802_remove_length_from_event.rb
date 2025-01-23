class RemoveLengthFromEvent < ActiveRecord::Migration[8.0]
  def change
    remove_column :events, :length, :time
  end
end
