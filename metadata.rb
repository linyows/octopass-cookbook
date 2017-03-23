name 'octopass'
maintainer 'linyows'
maintainer_email 'linyows@gmail.com'
license 'MIT'
description 'Installs/Configures octopass'
long_description 'Installs/Configures octopass'
version '0.1.0'

%w(centos).each do |os|
  supports os
end

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
issues_url 'https://github.com/linyows/octopass/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
source_url 'https://github.com/linyows/octopass' if respond_to?(:source_url)
