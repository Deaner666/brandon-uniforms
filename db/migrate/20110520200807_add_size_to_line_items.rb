class AddSizeToLineItems < ActiveRecord::Migration
  def self.up
    change_table :line_items do |t|
      t.string :size
    end
  end

  def self.down
    change_table :line_items do |t|
      t.remove :size
    end
  end
end
