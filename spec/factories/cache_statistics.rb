# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cache_statistic do
    log_time "2012-11-04 13:44:36"
    num_of_users 1
    bandwidth_demand 1
    num_of_caches 1
    storage_donated 1
    bandwidth_donated 1
    bandwidth_effectively_used 1
    server_load 1
  end
end
