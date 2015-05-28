# fog:SoftLayer:<datacenter>
class Chef
module Provisioning
module FogDriver
  module Providers
    class SoftLayerIbm < FogDriver::Driver

      Driver.register_provider_class('SoftLayerIbm', FogDriver::Providers::SoftLayerIbm)

      def creator
        compute_options[:softlayer_username]
      end


      def self.compute_options_for(provider, id, config)
        new_compute_options = {}
        new_compute_options[:provider] = 'SoftLayerIbm'

        new_config = { :driver_options => { :compute_options => new_compute_options }}

        new_defaults = {
          :driver_options => { :compute_options => {} },
          :machine_options => { :bootstrap_options => {} }
        }

        result = Cheffish::MergedConfig.new(new_config, config, new_defaults)

        new_defaults[:machine_options][:bootstrap_options][:datacenter] = id if (id && id != '')

        credential = Fog.credentials

        new_compute_options[:softlayer_username] ||= credential[:softlayer_username]

        [result, id]
      end

      def bootstrap_options_for(action_handler, machine_spec, machine_options)
        opts = super
        if opts[:bare_metal]
          #these don't work with fog-softlayer bare_metal for some reason...
          opts.delete :key_name
          opts.delete :tags
        end

        opts
      end

      def find_floating_ips(server)
          []
      end
    end
  end
end
end
end
