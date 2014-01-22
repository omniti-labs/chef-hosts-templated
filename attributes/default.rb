# The entries to put in the hosts file
# It's a simple mapping. Example usage:
# :hosts => {
#   :entries => {
#       "10.20.30.40" => "myhost",
#       "10.20.30.41" => "anotherhost anotherhost.int.domain.com"
#   }
# }
default[:hosts][:enabled] = true
default[:hosts][:entries] = {}
