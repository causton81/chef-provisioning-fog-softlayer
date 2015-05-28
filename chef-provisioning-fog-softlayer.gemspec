Gem::Specification.new do |s|
	s.name        = 'chef-provisioning-fog-softlayer'
	s.version     = '0.3.0'
	s.licenses    = ['MIT']
	s.summary     = "SoftLayer driver for chef-provisioning-fog"
	s.description = "export CHEF_DRIVER=fog:SoftLayer:dal05 #where dal05 is target datacenter."
	s.authors     = ["Christopher F. Auston"]
	s.email       = 'causton@softlayer.com'
	s.files       = ["LICENSE.md", "lib/chef/provisioning/fog_driver/providers/softlayeribm.rb"]
	s.homepage    = 'https://sldn.softlayer.com'
	s.add_runtime_dependency 'chef-provisioning-fog', '~> 0.11'
end
