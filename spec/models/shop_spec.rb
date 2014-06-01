require 'spec_helper'

describe Shop do
  it { should have_many :products }
  it { should validate_presence_of(:name) }
end
