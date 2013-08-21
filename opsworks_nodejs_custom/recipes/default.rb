if ::File.exist?('/usr/bin/node') && !::File.exist?('/usr/local/bin/node')
  link '/usr/local/bin/node' do
    to '/usr/bin/node'
  end
end