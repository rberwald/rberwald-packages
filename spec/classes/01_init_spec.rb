require 'spec_helper'

describe 'packages' do
  describe 'packages' do
    let (:params) {{
      :packages => {},
      :package_defaults => {},
      :purge_packages => false,
      :signal_purge_only => false,
    }}

    it { should compile.with_all_deps }

    it { should contain_class('packages') }

    it { should contain_resources('package').with( {
            'purge'              => false,
            'noop'               => false,
          }
        )
      }

  end

end
