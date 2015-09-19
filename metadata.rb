name             'uhostapi'
maintainer       'Mark C Allen'
maintainer_email 'mark@markcallen.com'
license          'Apache 2.0'
description      'Installs/Configures the uhost api'
long_description 'Installs/Configures the uhost api'
version          '0.4.0'

%w{ ubuntu centos }.each do |os|
  supports os
end

%w{ apt users nginx hostname certificate hostsfile nodejs mongodb redisio }.each do |cb|
  depends cb
end
