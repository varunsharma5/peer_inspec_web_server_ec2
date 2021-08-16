control 'ec2-01' do
  impact 1
  title 'EC2 Instance compliance checks'
  desc 'EC2 Instance compliance checks'
  
  aws_ec2_instances.where(tags: /"Tier"=>"web"/).instance_ids.each do |id|
    describe aws_ec2_instance(id) do
      its('image_id') { should eq 'ami-0b1fd547bf5aae708' }
    end
  end
  describe aws_security_group(group_name: 'web_server_sg') do
    it { should exist }
  end
  describe aws_security_group(group_name: 'web_server_sg') do
    it { should allow_in(port: 8080, ipv4_range: '0.0.0.0/0') }
  end
end
