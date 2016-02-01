require 'spec_helper'
describe 'filetouch' do

  context 'with defaults for all parameters' do
    it { should contain_class('filetouch') }
  end
end
