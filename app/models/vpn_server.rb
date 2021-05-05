class VpnServer < ApplicationRecord
  def self.random
    order('RANDOM()').first
  end  
end
