require 'spec_helper'

describe Cart do
  it { should belong_to(:user) }
end
