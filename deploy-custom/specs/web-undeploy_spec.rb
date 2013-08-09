require 'minitest/spec'

describe_recipe 'deploy-custom::web-undeploy' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

end
