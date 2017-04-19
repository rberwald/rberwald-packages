require 'spec_helper'

describe 'packages' do
  describe 'Single package as parameter' do
    let (:params) {{
      :packages => {
        't_pkg1' => {
          'ensure' => 'latest',
        }
      },
      :purge_packages => false,
      :signal_purge_only => false,
      :package_defaults => {},
    }}

    it { should contain_package('t_pkg1').with( {
          'ensure'       => 'latest',
        }
      )
    }
  end

  describe 'Multiple packages as parameter' do
    let (:params) {{
      :packages => {
        't_pkg1' => {
          'ensure' => 'latest',
        },
        't_pkg2' => {
          'ensure'   => 'v1.2.3',
          'provider' => 'appel',
        },
      },
      :purge_packages => false,
      :signal_purge_only => false,
      :package_defaults => {},
    }}

    it { should contain_package('t_pkg1').with( {
          'ensure' => 'latest',
        }
      )
    }

    it { should contain_package('t_pkg2').with( {
          'ensure'   => 'v1.2.3',
          'provider' => 'appel',
        }
      )
    }
  end

  describe 'Package settings merge with default settings' do
    let (:params) {{
      :packages => {
        't_pkg1' => {
          'ensure' => 'latest',
        },
        't_pkg2' => {
          'ensure'   => 'v1.2.3',
          'provider' => 'appel',
        },
      },
      :purge_packages => false,
      :signal_purge_only => false,
      :package_defaults => {
        'provider' => 'yum',
      },
    }}

    it { should contain_package('t_pkg1').with( {
          'ensure'   => 'latest',
          'provider' => 'yum',
        }
      )
    }

    it { should contain_package('t_pkg2').with( {
          'ensure'   => 'v1.2.3',
          'provider' => 'appel',
        }
      )
    }
  end



end
