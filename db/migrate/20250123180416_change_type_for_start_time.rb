class ChangeTypeForStartTime < ActiveRecord::Migration[8.0]
  def change
    change_column :events, :end_time, :datetime
  end
end
