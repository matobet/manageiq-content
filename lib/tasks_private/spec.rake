namespace :spec do
  desc "Setup environment for specs"
  task :setup => ["app:test:initialize", "app:test:verify_no_db_access_loading_rails_environment", "app:test:setup_db"]
end

RSpec::Core::RakeTask.new(:spec => ["app:test:initialize", "app:evm:compile_sti_loader"]) do |t|
  spec_dir = File.expand_path("../../spec", __dir__)
  EvmTestHelper.init_rspec_task(t, ['--require', File.join(spec_dir, 'spec_helper')])
  t.pattern = FileList[spec_dir + '/**/*_spec.rb'].exclude(spec_dir + '/manageiq/**/*_spec.rb')
end
