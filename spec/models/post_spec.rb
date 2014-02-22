require 'spec_helper'

describe Post do
  describe :validations do
    it { should validate_presence_of :content }
  end

  describe :associations do
    it { should belong_to :user }
  end
end
