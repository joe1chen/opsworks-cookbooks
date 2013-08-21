nodejs_path = "/usr/bin/node"
old_nodejs_path = "/usr/local/bin/node"
symlink_required = !::File.exists?(old_nodejs_path) && ::File.exists?(nodejs_path) && system("#{nodejs_path} -v | grep -q '#{node[:opsworks_nodejs][:version]}'")

if symlink_required
  link old_nodejs_path do
    to nodejs_path
  end
end
