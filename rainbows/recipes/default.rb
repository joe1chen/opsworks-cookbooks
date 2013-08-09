ruby_block "ensure only our rainbows version is installed by deinstalling any other version" do
  block do
    ensure_only_gem_version('rainbows', node[:rainbows][:version])
  end
end
