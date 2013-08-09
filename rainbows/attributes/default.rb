include_attribute 'rails::rails'

default[:rainbows][:worker_processes] = node[:rails][:max_pool_size] ? node[:rails][:max_pool_size] : 4
default[:rainbows][:backlog] = 1024
default[:rainbows][:timeout] = 60
default[:rainbows][:preload_app] = true
default[:rainbows][:version] = '4.5.0'
default[:rainbows][:tcp_nodelay] = true
default[:rainbows][:tcp_nopush] = false
default[:rainbows][:tries] = 5
default[:rainbows][:delay] = 0.5
default[:rainbows][:accept_filter] = "httpready"

# Rainbows Specific Attributes
default[:rainbows][:concurrency] = 'EventMachine'
default[:rainbows][:worker_processes] = 100