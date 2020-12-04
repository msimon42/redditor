class Buzzword < ApplicationRecord
  def self.get_score(word_list)
    values = ActiveRecord::Base.connection.execute(
      """
        SELECT value FROM buzzwords
        WHERE #{convert_to_like(word_list)}

      """
    )

    values.sum{|v| v['value']}
  end

  private
    def self.convert_to_like(list)
      list.map{ |word| "word = '#{word}'"  }.join(' OR ')
    end
end
