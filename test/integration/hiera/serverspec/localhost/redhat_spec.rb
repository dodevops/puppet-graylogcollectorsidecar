require 'spec_helper'

if ['redhat'].include?(os[:family])

  # Check configuration

  describe file('/etc/graylog/collector-sidecar/collector_sidecar.yml') do
    it { is_expected.to exist }
    it { is_expected.to be_file }
    it { is_expected.to contain('TESTTAG') }
    it { is_expected.to contain('tls_skip_verify: true') }
  end

  # Check service

  describe service('collector-sidecar') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

end
