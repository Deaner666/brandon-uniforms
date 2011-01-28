class DropOrdersProductsTable < ActiveRecord::Migration
  def self.up
    drop_table :orders_products
  end

  def self.down
    create_table :orders_products, :id => false do |t|
      t.references :order, :product
    end
  end
end
