#
# Description: <Method description here>
#
module ManageIQ
  module Automate
    module Infrastructure
      module VM
        module Transform
          module Import
            class ListDriverIsos
              def initialize(handle = $evm)
                @handle = handle
              end

              def main
                values_hash = {}
                values_hash[nil] = '-- select drivers ISO from list --'

                provider_id = @handle.root['dialog_provider']
                if provider_id.present? && provider_id != '!'
                  provider = @handle.vmdb(:ext_management_system, provider_id)
                  if provider.nil?
                    values_hash[nil] = 'None'
                  else
                    provider.iso_datastore.iso_images.pluck(:name).grep(/toolsSetup/).each do |iso|
                      values_hash[iso] = iso
                    end
                  end
                end
                list_values = {
                  'sort_by'   => :description,
                  'data_type' => :string,
                  'required'  => true,
                  'values'    => values_hash,
                  'visible'   => @handle.root['dialog_install_drivers']
                }
                list_values.each { |key, value| @handle.object[key] = value }
              end
            end
          end
        end
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  ManageIQ::Automate::Infrastructure::VM::Transform::Import::ListDriverIsos.new.main
end
