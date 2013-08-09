require 'minitest/spec'

describe_recipe 'rainbows::default' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

  it 'installs rainbows' do
    assert system("#{node[:dependencies][:gem_binary]} list | grep rainbows | grep '#{node[:rainbows][:version]}'")
  end
end
