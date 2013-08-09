require 'minitest/spec'

describe_recipe 'deploy-custom::nodejs-rollback' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

end
