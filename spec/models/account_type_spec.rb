require 'spec_helper'

describe AccountType do
  before(:each) do
    Factory(:assets)
  end
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:code) }
end
