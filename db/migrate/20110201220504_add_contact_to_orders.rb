class AddContactToOrders < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.string :contact
    end
  end

  def self.down
    change_table :orders do |t|
      t.remove :contact
    end
  end
end
