# stop Rainbows service per app
node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping rainbows::rails application #{application} as it is not an Rails app")
    next
  end

  execute "stop rainbows" do
    command "#{deploy[:deploy_to]}/shared/scripts/rainbows stop"
    only_if do
      File.exists?("#{deploy[:deploy_to]}/shared/scripts/rainbows")
    end
  end
end
