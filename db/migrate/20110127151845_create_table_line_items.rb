class CreateTableLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.references :order, :product
      t.integer    :quantity
    end
  end

  def self.down
    drop_table :line_items
  end
end
