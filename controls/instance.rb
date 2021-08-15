control 'ec2-01' do
  impact 1
  title 'EC2 Instance compliance checks'
  desc 'EC2 Instance compliance checks'
  
  describe aws_ec2_instance(name: 'peer.review.02-webserver-vm-centos-2*') do
    it { should be_running }
  end
  describe aws_security_group(group_name: 'web_server_sg') do
    it { should exist }
  end
  describe aws_security_group(group_name: 'web_server_sg') do
    it { should allow_in(port: 8080, ipv4_range: '0.0.0.0/0') }
  end
end
