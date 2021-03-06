describe "Quota Validation" do
  include Spec::Support::QuotaHelper
  include Spec::Support::ServiceTemplateHelper

  def run_automate_method(attrs)
    MiqAeEngine.instantiate("/ManageIQ/system/request/Call_Instance?namespace=System/CommonMethods&" \
                            "class=QuotaMethods&instance=requested&#{attrs.join('&')}", @user)
  end

  def vm_attrs
    ["MiqRequest::miq_request=#{@miq_provision_request.id}"]
  end

  def service_attrs
    ["MiqRequest::miq_request=#{@service_request.id}&"\
     "vmdb_object_type=service_template_provision_request"]
  end

  def reconfigure_attrs
    ["MiqRequest::miq_request=#{@reconfigure_request.id}&"\
    "vmdb_object_type=VmReconfigureRequest"]
  end

  def check_results(requested_hash, storage, cpu, vms, memory)
    expect(requested_hash[:storage]).to eq(storage)
    expect(requested_hash[:cpu]).to eq(cpu)
    expect(requested_hash[:vms]).to eq(vms)
    expect(requested_hash[:memory]).to eq(memory)
  end

  context "Service provisioning quota" do
    it "generic calculate_requested" do
      setup_model("generic")
      build_generic_service_item
      expect { run_automate_method(service_attrs) }.not_to raise_exception
    end

    it "generic ansible tower calculate_requested" do
      setup_model("generic")
      build_generic_ansible_tower_service_item
      expect { run_automate_method(service_attrs) }.not_to raise_exception
    end

    it "vmware service item calculate_requested" do
      setup_model("vmware")
      build_small_environment
      build_vmware_service_item
      ws = run_automate_method(service_attrs)
      check_results(ws.root['quota_requested'], 512.megabytes, 4, 1, 1.gigabytes)
    end
  end

  context "Service Bundle provisioning quota" do
    it "Bundle of 2, google and vmware" do
      create_service_bundle([google_template, vmware_template])
      expect { run_automate_method(service_attrs) }.not_to raise_exception
    end

    it "Bundle of 2, google and generic" do
      create_service_bundle([google_template, generic_template])
      expect { run_automate_method(service_attrs) }.not_to raise_exception
    end
  end

  context "VM provisioning quota" do
    it "vmware calculate_requested" do
      setup_model("vmware")
      ws = run_automate_method(vm_attrs)
      check_results(ws.root['quota_requested'], 512.megabytes, 4, 1, 1.gigabytes)
    end

    it "google calculate_requested" do
      setup_model("google")
      ws = run_automate_method(vm_attrs)
      check_results(ws.root['quota_requested'], 10.gigabytes, 4, 1, 1024)
    end
  end

  context "VM provisioning multiple vms quota" do
    it "vmware calculate_requested number of vms 3" do
      setup_model("vmware")
      @miq_provision_request.options[:number_of_vms] = 3
      @miq_provision_request.save
      ws = run_automate_method(vm_attrs)
      check_results(ws.root['quota_requested'], 1536.megabytes, 12, 3, 3.gigabytes)
    end

    it "google calculate_requested number of vms 3" do
      setup_model("google")
      @miq_provision_request.options[:number_of_vms] = 3
      @miq_provision_request.save
      ws = run_automate_method(vm_attrs)
      check_results(ws.root['quota_requested'], 30.gigabytes, 12, 3, 3.kilobytes)
    end
  end

  context "VmReconfig quota calculate_request" do
    it "add 2 cpus and add 4096 memory " do
      setup_model("vmware_reconfigure")
      @reconfigure_request.update_attributes(:options => {:src_ids => [@vm_vmware.id], :cores_per_socket => 2,\
      :number_of_sockets => 2, :number_of_cpus => 4, :vm_memory => 8192, :request_type => :vm_reconfigure,\
      :disk_add => [{"disk_size_in_mb" => "10", "persistent" => true, "thin_provisioned" => true,\
      "dependent" => true, "bootable" => false}]})
      ws = run_automate_method(reconfigure_attrs)
      check_results(ws.root['quota_requested'], 10.megabytes, 2, 0, 4096.megabytes)
    end

    it "minus 1 cpu and minus 2048 memory" do
      setup_model("vmware_reconfigure")
      @reconfigure_request.update_attributes(:options => {:src_ids => [@vm_vmware.id], :cores_per_socket => 1,\
      :number_of_sockets => 1, :number_of_cpus => 1, :vm_memory => 2048, :request_type => :vm_reconfigure})
      ws = run_automate_method(reconfigure_attrs)
      check_results(ws.root['quota_requested'], 0, -1, 0, -2048.megabytes)
    end

    it "no change" do
      setup_model("vmware_reconfigure")
      @reconfigure_request.update_attributes(:options => {:src_ids => [@vm_vmware.id], :cores_per_socket => 2,\
      :number_of_sockets => 1, :number_of_cpus => 2, :vm_memory => 4096, :request_type => :vm_reconfigure})
      ws = run_automate_method(reconfigure_attrs)
      check_results(ws.root['quota_requested'], 0, 0, 0, 0.megabytes)
    end
  end
end
