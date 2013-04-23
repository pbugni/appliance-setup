# Class: appliance_components::ajp
#
# This class installs and configures ajp for Apache.
#
# Requires: appliance_components::apache
#
class appliance_components::ajp {
  include appliance_components::apache
  include ::apache::mod::proxy
  include ::apache::mod::proxy_http
  apache::mod { 'proxy_ajp': }
}
