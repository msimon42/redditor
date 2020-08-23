class Bot < ApplicationRecord

  def self.random
    order('RANDOM()').first
  end
end
