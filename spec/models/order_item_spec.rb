require 'spec_helper'

describe OrderItem do
  it { should belong_to :order }
  it { should belong_to :product }
  it { should accept_nested_attributes_for :order }
end
