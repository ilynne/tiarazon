require 'spec_helper'

describe Order do
  it { should have_many :order_items }
end
