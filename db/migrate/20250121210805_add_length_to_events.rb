class AddLengthToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :length, :integer
  end
end
