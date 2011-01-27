class CreateTableOrdersProducts < ActiveRecord::Migration
  def self.up
    create_table :orders_products, :id => false do |t|
      t.references :order, :product
    end
  end

  def self.down
    drop_table :orders_products
  end
end
