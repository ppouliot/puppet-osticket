require 'spec_helper'
describe 'osticket' do

  context 'with defaults for all parameters' do
    it { should contain_class('osticket') }
  end
end
