require 'serverspec'

set :backend, :exec


['docker, 'git'].each do |pkg|
  describe package(pkg) do
    it { is_expected.to be_installed }
  end
end

# describe group('nexus') do
#   it { is_expected.to exist }
# end

# describe user('nexus') do
#   it { is_expected.to exist }
#   it { is_expected.to belong_to_group 'nexus' }
#   it { is_expected.to have_login_shell '/bin/bash' }
# end

# describe file('/usr/share') do
#   it { is_expected.to be_directory }
#   it { is_expected.to be_owned_by 'root' }
#   it { is_expected.to be_grouped_into 'root' }
# end