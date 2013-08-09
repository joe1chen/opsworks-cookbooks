require 'minitest/spec'

describe_recipe 'deploy-custom::rails-rollback' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

end
