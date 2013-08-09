unless node[:opsworks][:skip_uninstall_of_other_rails_stack]
  include_recipe "apache2::uninstall"
end

include_recipe "nginx"
include_recipe "rainbows"

# setup Rainbows service per app
node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping rainbows::rails application #{application} as it is not an Rails app")
    next
  end

  opsworks_deploy_user do
    deploy_data deploy
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  template "#{deploy[:deploy_to]}/shared/scripts/rainbows" do
    mode '0755'
    owner deploy[:user]
    group deploy[:group]
    source "rainbows.service.erb"
    variables(:deploy => deploy, :application => application)
  end

  service "rainbows_#{application}" do
    start_command "#{deploy[:deploy_to]}/shared/scripts/rainbows start"
    stop_command "#{deploy[:deploy_to]}/shared/scripts/rainbows stop"
    restart_command "#{deploy[:deploy_to]}/shared/scripts/rainbows restart"
    status_command "#{deploy[:deploy_to]}/shared/scripts/rainbows status"
    action :nothing
  end

  template "#{deploy[:deploy_to]}/shared/config/rainbows.conf" do
    mode '0644'
    owner deploy[:user]
    group deploy[:group]
    source "rainbows.conf.erb"
    variables(:deploy => deploy, :application => application)
  end
end
