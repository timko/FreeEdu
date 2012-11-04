class CreateCacheStatistics < ActiveRecord::Migration
  def change
    create_table :cache_statistics do |t|
      t.datetime :log_time
      t.integer :num_of_users
      t.integer :bandwidth_demand
      t.integer :num_of_caches
      t.integer :storage_donated
      t.integer :bandwidth_donated
      t.integer :bandwidth_effectively_used
      t.integer :server_load

      t.timestamps
    end
  end
end
