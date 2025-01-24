class ChangeDataTypeForEndTime < ActiveRecord::Migration[8.0]
  def change
    change_column :events, :start_time, :datetime
  end
end
