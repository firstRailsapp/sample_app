class CreateSimulatePages < ActiveRecord::Migration
  def self.up
    create_table :simulate_pages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :simulate_pages
  end
end
