# Cookbook Name:: octopass
# Recipe:: default

package 'curl'

execute 'packageclound-setup' do
  command 'curl -s https://packagecloud.io/install/repositories/linyows/octopass/script.rpm.sh | bash'
  action :nothing
end

yum_package 'octopass' do
  version node['octopass']['version']
  notifies :run, 'execute[packageclound-setup]', :before
end

template '/etc/octopass.conf' do
  cookbook node['octopass']['conf_cookbook']
  source 'octopass.conf.erb'
end

file '/etc/octopass.conf.example' do
  action :delete
end

if node['octopass']['sudoers_tmpl_cookbook']
  template 'sudoers.d' do
    g = node['octopass']['group'] || node['octopass']['team']
    path "/etc/sudoers.d/#{g}"
    cookbook node['octopass']['sudoers_tmpl_cookbook']
    source 'sudoers.d-octopass.erb'
    variables(group_name: g)
  end
end

if node['octopass']['pam_conf_cookbook']
  template '/etc/pam.d/system-auth-ac' do
    cookbook node['octopass']['pam_conf_cookbook']
    source 'pam.d-system-auth-ac.erb'
  end

  template '/etc/pam.d/sshd' do
    cookbook node['octopass']['pam_conf_cookbook']
    source 'pam.d-sshd.erb'
  end
end

if node['octopass']['sshd_conf_cookbook']
  service 'sshd' do
    action [:enable]
    supports :start => true, :status => true, :restart => true, :reload => true
  end

  template '/etc/ssh/sshd_config' do
    cookbook node['octopass']['sshd_conf_cookbook']
    source 'ssh-sshd_config.erb'
    notifies :restart, 'service[sshd]'
  end
end

template '/etc/nsswitch.conf' do
  cookbook node['octopass']['nsswitch_conf_cookbook']
  source 'nsswitch.conf.erb'
end if node['octopass']['nsswitch_conf_cookbook']
