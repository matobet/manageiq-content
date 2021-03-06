# Change Log

All notable changes to this project will be documented in this file.

## Unreleased Sprint 65 Ending 2017-07-24

### Added
- v2v: Support virtio-win drivers ISO [(#147)](https://github.com/ManageIQ/manageiq-content/pull/147)
- Host removal [(#146)](https://github.com/ManageIQ/manageiq-content/pull/146)
- Host install [(#145)](https://github.com/ManageIQ/manageiq-content/pull/145)
- Host update [(#144)](https://github.com/ManageIQ/manageiq-content/pull/144)

### Fixed
- v2v: Fix filtering of drivers ISO to display [(#143)](https://github.com/ManageIQ/manageiq-content/pull/143)

## Unreleased Sprint 64 Ending 2017-07-10

### Added
- Event switchboard entries for Amazon EBS events. [(#137)](https://github.com/ManageIQ/manageiq-content/pull/137)

### Fixed
- v2v: Fix confusing message in WaitForImport state [(#140)](https://github.com/ManageIQ/manageiq-content/pull/140)
- v2v: Fix list drivers on missing ISO domain [(#139)](https://github.com/ManageIQ/manageiq-content/pull/139)
- Fixed quota calculations for multiple vms in requested method. [(#128)](https://github.com/ManageIQ/manageiq-content/pull/128)

## Unreleased Sprint 63 Ending 2017-06-19

### Added
- v2v: Add automate methods for post-import network configuration [(#123)](https://github.com/ManageIQ/manageiq-content/pull/123)
- Add Available_Projects method for dynamic dropdown in container template service dialog [(#127)](https://github.com/ManageIQ/manageiq-content/pull/127)

### Changed
- Update method order_ansible_playbook.rb to match the move of create_service_provision_request [(#126)](https://github.com/ManageIQ/manageiq-content/pull/126)

## Unreleased Sprint 62 Ending 2017-06-05

### Added
- Targeted refresh enhacements for VM import\rename\migration events [(#119)](https://github.com/ManageIQ/manageiq-content/pull/119)
- v2v: Add support for driver ISOs [(#121)](https://github.com/ManageIQ/manageiq-content/pull/121)
- Add automate methods for VM import between providers [(#36)](https://github.com/ManageIQ/manageiq-content/pull/36)

### Fixed
- Require just rails/engine [(#120)](https://github.com/ManageIQ/manageiq-content/pull/120)

## Unreleased Sprint 61 Ending 2017-05-22

### Fixed
- Support embedded_ansible to fetch credentials from provider [(#112)](https://github.com/ManageIQ/manageiq-content/pull/112)

## Unreleased Sprint 60 Ending 2017-05-08

### Fixed
- Change exceeds message in log to warn type. [(#104)](https://github.com/ManageIQ/manageiq-content/pull/104)
- Change errors in log to error type. [(#101)](https://github.com/ManageIQ/manageiq-content/pull/101)
- Changed ${/#ae_reason} to a string value in on_error methods. [(#98)](https://github.com/ManageIQ/manageiq-content/pull/98)
- Add quota checking for VMReconfigure tests. [(#56)](https://github.com/ManageIQ/manageiq-content/pull/56)

## Fine-1

### Added
- Remove createfolder event handler since it is now handled by MiqVimBrokerWorker [(#100)](https://github.com/ManageIQ/manageiq-content/pull/100)
- Added LenovoXclarity Namespace to EMS Events into Automate [(#77)](https://github.com/ManageIQ/manageiq-content/pull/77)
- Automate - Notification for Ansible and Cloud provisioning errors. [(#15)](https://github.com/ManageIQ/manageiq-content/pull/15)
- Generic Service State Machine update_status change [(#85)](https://github.com/ManageIQ/manageiq-content/pull/85)
- Generic Service State Machine - new retirement instances. [(#72)](https://github.com/ManageIQ/manageiq-content/pull/72)
- Add Automate modeling for Embedded Ansible Events. [(#69)](https://github.com/ManageIQ/manageiq-content/pull/69)
- Add Automate modeling for External Ansible Tower Events. [(#68)](https://github.com/ManageIQ/manageiq-content/pull/68)
- Change default behavior of Service Retirement to not remove the Service [(#76)](https://github.com/ManageIQ/manageiq-content/pull/76)
- Generic Service State Machine - added notifications and improved logging. [(#61)](https://github.com/ManageIQ/manageiq-content/pull/61)
- Automate method to list ansible credentials [(#53)](https://github.com/ManageIQ/manageiq-content/pull/53)
- Add openstack cloud tenant events [(#59)](https://github.com/ManageIQ/manageiq-content/pull/59)

### Changed
- In the F release ConfigurationManagement has been deprecated [(#87)](https://github.com/ManageIQ/manageiq-content/pull/87)
- Refactoring and fixing cloud/vm/provisioning/placement/best_fit_amazon method. [(#63)](https://github.com/ManageIQ/manageiq-content/pull/63)
- Generic Service State Machine method update. [(#51)](https://github.com/ManageIQ/manageiq-content/pull/51)
- Generic Service State Machine methods modified to use Service object. [(#58)](https://github.com/ManageIQ/manageiq-content/pull/58)

### Fixed
- Add notifications for finish_retirement. [(#106)](https://github.com/ManageIQ/manageiq-content/pull/106)
- Add policy checking for the retirement request. [(#86)](https://github.com/ManageIQ/manageiq-content/pull/86)
- Modified vmware_best_fit_least_utilized to not select Hosts in maintenance. [(#81)](https://github.com/ManageIQ/manageiq-content/pull/81)
- Added method instances for EmbeddedAnsible [(#80)](https://github.com/ManageIQ/manageiq-content/pull/80)
- Fixes VM extend retirement [(#62)](https://github.com/ManageIQ/manageiq-content/pull/62)
- Disabled DeleteFromVMDB in 2 places [(#55)](https://github.com/ManageIQ/manageiq-content/pull/55)
- Fixed typo in check_ssh method [(#66)](https://github.com/ManageIQ/manageiq-content/pull/66)
- Generic State Machine provision instance fix [(#54)](https://github.com/ManageIQ/manageiq-content/pull/54)
