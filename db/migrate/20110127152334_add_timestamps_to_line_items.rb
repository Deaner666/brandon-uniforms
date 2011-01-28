class AddTimestampsToLineItems < ActiveRecord::Migration
  def self.up
    change_table :line_items do |t|
      t.timestamps
    end
  end

  def self.down
    change_table :line_items do |t|
      t.remove :created_at, :updated_at
    end
  end
end
