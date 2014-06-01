require 'spec_helper'

describe Product do
  it { should belong_to :shop }
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should accept_nested_attributes_for :shop }
end
