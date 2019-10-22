# frozen_string_literal: true

require 'spec_helper'
describe 'smarthost' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'sdf' do
        case facts[:operatingsystem]
        when 'Debian'
          context 'd' do
            # if :operatingsystemmajrelease == '8'
            it { is_expected.to contain_class('smarthost') }
            it { is_expected.to contain_class('smarthost::params') }
            it { is_expected.to contain_class('smarthost::exim4').that_comes_before('Class[smarthost::exim4::install]') }
            it { is_expected.to contain_class('smarthost::exim4::install').that_comes_before('Class[smarthost::exim4::config]') }
            it { is_expected.to contain_class('smarthost::exim4::config').that_notifies('Class[smarthost::exim4::service]') }
            it { is_expected.to contain_class('smarthost::exim4::service') }
            # end
          end
        end
      end
    end
  end
end
