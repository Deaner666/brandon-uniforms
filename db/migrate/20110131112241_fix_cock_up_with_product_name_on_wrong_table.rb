class FixCockUpWithProductNameOnWrongTable < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.remove :product_name
    end
    change_table :line_items do |t|
      t.string :product_name
    end
  end

  def self.down
    change_table :products do |t|
      t.string :product_name
    end
    change_table :line_items do |t|
      t.remove :product_name
    end
  end
end
