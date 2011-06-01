class AddJobTitleToOrders < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.string :job_title
    end
  end

  def self.down
    change_table :orders do |t|
      t.remove :job_title
    end
  end
end
