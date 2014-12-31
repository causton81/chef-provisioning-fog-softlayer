# fog:SoftLayer:<datacenter>
class Chef
module Provisioning
module FogDriver
  module Providers
    class SoftLayer < FogDriver::Driver

      Driver.register_provider_class('SoftLayer', FogDriver::Providers::SoftLayer)

      def creator
        compute_options[:softlayer_username]
      end


      def self.compute_options_for(provider, id, config)
        new_compute_options = {}
        new_compute_options[:provider] = provider

        new_config = { :driver_options => { :compute_options => new_compute_options }}

        new_defaults = {
          :driver_options => { :compute_options => {} },
          :machine_options => { :bootstrap_options => {} }
        }

        result = Cheffish::MergedConfig.new(new_config, config, new_defaults)

        new_defaults[:machine_options][:bootstrap_options][:datacenter] = id if (id && id != '')
        new_defaults[:machine_options][:bootstrap_options][:ram] = 1024
        new_defaults[:machine_options][:bootstrap_options][:cpu] = 1

        credential = Fog.credentials

        new_compute_options[:softlayer_username] ||= credential[:softlayer_username]

        [result, id]
      end

    end
  end
end
end
end
