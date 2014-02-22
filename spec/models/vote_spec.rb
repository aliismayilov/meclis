require 'spec_helper'

describe Vote do
  describe :validations do
    it { should validate_presence_of :value }
    it { should validate_numericality_of(:value)
          .is_greater_than_or_equal_to(-1)
          .is_less_than_or_equal_to(1) }
  end

  describe :associations do
    it { should belong_to :votable }
  end
end
