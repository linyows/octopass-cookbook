# Cookbook Name: octopass
# Attribute: default

default['octopass']['version']                = '0.2.0-1'

default['octopass']['endpoint']               = 'https://api.github.com'
default['octopass']['token']                  = nil
default['octopass']['organization']           = nil
default['octopass']['team']                   = nil
default['octopass']['group']                  = nil
default['octopass']['uid_starts']             = 2000
default['octopass']['gid']                    = 2000
default['octopass']['cache']                  = 300
default['octopass']['syslog']                 = false

default['octopass']['conf_cookbook']          = 'octopass'
default['octopass']['sudoers_tmpl_cookbook']  = nil
default['octopass']['sshd_conf_cookbook']     = nil
default['octopass']['pam_conf_cookbook']      = nil
default['octopass']['nsswitch_conf_cookbook'] = nil
