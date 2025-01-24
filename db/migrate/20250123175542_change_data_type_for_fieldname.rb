class ChangeDataTypeForFieldname < ActiveRecord::Migration[8.0]
  def self.up
    change_table :events do |t|
      t.change :start_time, :time
    end
  end
  def self.down
    change_table :events do |t|
      t.change :start_time, :datetime
    end
  end
end
